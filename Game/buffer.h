#pragma once
#ifndef Buffer_H
#define Buffer_H

#include "uv.h"
#include <algorithm>

#ifdef _WIN32
#include <Windows.h>
#endif

struct send_package {
	int size;
	char * buf;
};

struct recv_package {

	int pos;
	int size;
	char * buf;
	char header[4];
	void * data;

	recv_package()
	{
		pos = NULL;

		size = NULL;

		buf = NULL;
	}

	~recv_package()
	{
		reset();
	}

	char * copy(int & length)
	{
		length = size - 4;

        auto str = (char *)malloc(length + 1);

        memcpy(str, buf + 4, length);

        str[length] = NULL;

		return str;
	}

	void reset()
	{
		if (buf)
			free(buf);

		pos = NULL;

		size = NULL;

		buf = NULL;
	}

	bool read(char * base, int max, int & length)
	{
#ifdef _MSC_VER
        if (size)
        {
            length = min(size - pos, max);

            memcpy(buf + pos, base, length);

            pos += length;

            if (pos == size)
                return true;
        }
        else
        {
            length = min(4 - pos, max);

            memcpy(header + pos, base, length);

            pos += length;

            if (pos == 4)
            {
                memcpy(&size, header, 4);

                buf = (char *)malloc(size + 1);

                buf[size] = NULL;
            }
        }
#else
        if (size)
        {
            length = std::min(size - pos, max);

            memcpy(buf + pos, base, length);

            pos += length;

            if (pos == size)
                return true;
        }
        else
        {
            length = std::min(4 - pos, max);

            memcpy(header + pos, base, length);

            pos += length;

            if (pos == 4)
            {
                memcpy(&size, header, 4);

                buf = (char *)malloc(size + 1);

                buf[size] = NULL;
            }
        }
#endif

		return false;
	}
};

#endif
