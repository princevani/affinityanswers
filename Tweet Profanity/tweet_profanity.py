# Importing required library
import re


# Defining a function used to calculate the profanity in the sentence.
def calculate_profanity(sentence, racial_slurs):
    words = sentence.split()
    profanity_count = 0

    # Iterating through all the words in sentence and checking if it is a Racial Slur
    for word in words:
        normalized_word = re.sub(r'[^\w\s]', '', word.lower())
        if normalized_word in racial_slurs:
            profanity_count += 1

    # Returning the profanity count if there is at least one word in the sentence
    return profanity_count / len(words) if len(words) > 0 else 0


# Start of the Program
def main():
    # Taking user input for ; tweet_file, racial_slurs
    data_path = input('Enter the path for tweet file: ')

    # Assuming the given set of slurs are as below:
    racial_slurs = {'racial1', 'racial2', 'racial3'}  # Set of racial slurs

    with open(data_path, 'r') as file:
        for line in file:
            sentences = line.split('.')
            for sentence in sentences:
                if sentence != '\n' and sentence != '':
                    degree_of_profanity = calculate_profanity(sentence, racial_slurs)
                    print(f"Sentence: {sentence}")
                    print(f"Degree of profanity: {round(degree_of_profanity, 2) * 100} %\n")


if __name__ == '__main__':
    main()
