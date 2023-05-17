# affinityanswers
Interesting questions related to Python(NLP), Dataset and Unix Shell Scripting

1. Imagine there is a file full of twitter's tweets by various users and you are provided a set of words that indicates racial slurs. Write a program that can indicate the degree of profanity for each sentence in the file. Write in any programming language (preferably in Python) - make any assumptions, but remember to state them.

Sol: 

In 'tweet_profanity.py' file, we define a function called calculate_profanity that takes a sentence and a set of racial slurs as input. It splits the sentence into individual words and checks if each word is present in the racial slurs set. If a word is found, it increments the profanity_count variable. Finally, it returns the ratio of profanity words to total words in the sentence.

The main function opens the file containing the tweets (tweets.txt in this example) and reads each line. It splits the lines by '.' and by interating through each sentences it calls the calculate_profanity function to determine the degree of profanity for that sentence. The result is then printed to the console.

This is a simple example and may not account for various factors such as context, variations of racial slurs, or other forms of offensive language. Building a comprehensive and accurate profanity detection system requires advanced natural language processing techniques.

2. Which is an interesting data set you discovered recently? Why is it your favorite?

Sol:

Recently I discover two different datasets 'Census-India' and 'Hospital & Beds In India'. Both the "India Census" dataset and the "Hospitals and Beds in India" dataset can be valuable resources for learning and gaining insights into different aspects of India's demographics and healthcare infrastructure. Here is how each dataset can be helpful in learning; however a brief information is attached in 'Why it is interesting' document.

3. This question is to test your aptitude for writing small shell scripts on Unix. Write a shell script that extracts the Scheme Name and Asset Value fields only from the given url and saves them in a csv file.

Sol:

* I have started solving the problem by creating a shell file using 'nano extract_data.sh'
* Declared the given URL and Outfile_file (CSV)
* Reading the source data with the help of 'curl -s ${url}'.
* Filtering the required data with the help of 'cut' command.
* Finally writing the data to the output file.
