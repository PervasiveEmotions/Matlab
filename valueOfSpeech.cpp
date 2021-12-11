#include <iostream>
#include <fstream>
#include <string>

int negativeComparision(std::string word){                  //This function takes a detected word as a parameter.
    std::ifstream ninFs;
    std::string negWord;

    ninFs.open("negat-words.txt");                          //The negative words file is opened.

    ninFs >> negWord;
    while(!ninFs.eof()){                                    //The detected word is compared to every single word in the file.
        if(negWord == word){
            ninFs.close();
            return 1;                                       //If a similarity is found, the function returns 1.
        }
        else{
            ninFs >> negWord;
        }
    }

    ninFs.close();
    return 0;                                               //If no similarities are found, the function returns 0.
}

int positiveComparision(std::string word){                  //This function takes a detected word as a parameter.
    std::ifstream pinFs;
    std::string posWord;

    pinFs.open("posit-words.txt");                          //The positive words file is opened.

    pinFs >> posWord;                                       
    while(!pinFs.eof()){                                    //The detected word is compared to every single word in the file.
        if(posWord == word){
            pinFs.close();
            return 1;                                       //If a similarity is found, the function returns 1.
        }
        else{
            pinFs >> posWord;
        }
    }

    pinFs.close();
    return 0;                                               //If no similarities are found, the function returns 0.
}

int valueOfSpeech(std::string textToAnalyse){                   //This function takes into parameter the text of the user's speech.
    std::string word;
    int numOfNegatives = 0;
    int numOfPositives = 0;

    for(int i = 0; i < textToAnalyse.size(); i++){              //It checks each character in the string until it finds a space or punctuation.
        if(textToAnalyse.at(i) != ' ' && textToAnalyse.at(i) != '.' && textToAnalyse.at(i) != '?' && textToAnalyse.at(i) != '!' && textToAnalyse.at(i) != ':' && textToAnalyse.at(i) != ';'){
            word = word + textToAnalyse.at(i);                  //If it doesn't, then a string is slowly formed from all the characters added.
        }
        else{
            int positiveComp = positiveComparision(word);       //Once a word is extracted, it is passed through two funtcions determining
            numOfPositives += positiveComp;                     //if it is positive or negative. The result is added to a counter for 
                                                                //the overall number of positive and negative words in the user's speech.
            int negativeComp = negativeComparision(word);
            numOfNegatives += negativeComp;

            word = "";                                          //Then the string is erased to prepare for a new word.
        }
    }

    int total = 0;                                              //The total number of positive words is substracted by the total number
    total = numOfPositives - numOfNegatives;                    //of negative words. This gives a negative value if there are more negative
                                                                //words and a positive value if there are more positive words.
    return total;                                               //The function then returns the result of this substraction.
}

int main(){
    std::string textToAnalyse;

    std::getline(std::cin,textToAnalyse);

    int output = valueOfSpeech(textToAnalyse);

    return output;
}
