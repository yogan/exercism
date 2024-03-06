#include <errno.h>
#include <stdint.h>
#include <stdlib.h>
#include "circular_buffer.h"

circular_buffer_t *new_circular_buffer(size_t capacity)
{
    circular_buffer_t *buffer = malloc(sizeof(circular_buffer_t));
    if (!buffer) {
        return NULL;
    }

    buffer->size = capacity;
    buffer->head = 0;
    buffer->tail = 0;
    buffer->count = 0;

    buffer->data = malloc(capacity * sizeof(buffer_value_t));
    if (!buffer->data) {
        free(buffer);
        buffer = NULL;
    }

    return buffer;
}

void clear_buffer(circular_buffer_t *buffer)
{
    buffer->head = 0;
    buffer->tail = 0;
    buffer->count = 0;
}

void delete_buffer(circular_buffer_t *buffer)
{
    free(buffer->data);
    free(buffer);
}

int16_t read(circular_buffer_t *buffer, buffer_value_t *value)
{
    if (buffer->count == 0) {
        errno = ENODATA;
        return EXIT_FAILURE;
    }

    buffer->count--;

    *value = buffer->data[buffer->head];
    buffer->head = (buffer->head + 1) % buffer->size;

    return EXIT_SUCCESS;
}

int16_t write(circular_buffer_t *buffer, buffer_value_t value)
{
    if (buffer->count == buffer->size) {
        errno = ENOBUFS;
        return EXIT_FAILURE;
    }

    buffer->count++;

    buffer->data[buffer->tail] = value;
    buffer->tail = (buffer->tail + 1) % buffer->size;

    return EXIT_SUCCESS;
}

int16_t overwrite(circular_buffer_t *buffer, buffer_value_t value)
{
    if (buffer->count == buffer->size) {
        buffer->head = (buffer->head + 1) % buffer->size;
    } else {
        buffer->count++;
    }

    buffer->data[buffer->tail] = value;
    buffer->tail = (buffer->tail + 1) % buffer->size;

    return EXIT_SUCCESS;
}
