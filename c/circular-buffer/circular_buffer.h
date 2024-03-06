#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H

typedef int16_t buffer_value_t;

typedef struct circular_buffer {
    buffer_value_t *data;
    int size;
    int head;
    int tail;
    int count;
} circular_buffer_t;

circular_buffer_t *new_circular_buffer(size_t size);
void clear_buffer(circular_buffer_t *buffer);
void delete_buffer(circular_buffer_t *buffer);
int16_t read(circular_buffer_t *buffer, buffer_value_t *value);
int16_t write(circular_buffer_t *buffer, buffer_value_t value);
int16_t overwrite(circular_buffer_t *buffer, buffer_value_t value);

#endif
