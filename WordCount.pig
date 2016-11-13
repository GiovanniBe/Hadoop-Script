
-- File: WordCount.pig
-- Author: Giovanni Bertulu, 2016-10-31
-- Description: Count the number of the words in a text file.

wordInput = LOAD '/data/file.txt' AS (line:chararray);

words = FOREACH wordInput GENERATE FLATTEN(TOKENIZE(line)) as word;

grouped = GROUP words BY word;

wordcount = FOREACH grouped GENERATE group, COUNT(words);

DUMP wordcount;

