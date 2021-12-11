#include <iostream>
#include <fstream>
#include <string>

int negativeComparision(std::string word){
    std::ifstream ninFs;
    std::string negWord;

    ninFs.open("negat-words.txt");

    ninFs >> negWord;
    while(!ninFs.eof()){
        if(negWord == word){
            ninFs.close();
            return 1;
        }
        else{
            ninFs >> negWord;
        }
    }

    ninFs.close();
    return 0;
}

int positiveComparision(std::string word){
    std::ifstream pinFs;
    std::string posWord;

    pinFs.open("posit-words.txt");

    pinFs >> posWord;
    while(!pinFs.eof()){
        if(posWord == word){
            pinFs.close();
            return 1;
        }
        else{
            pinFs >> posWord;
        }
    }

    pinFs.close();
    return 0;
}

int valueOfSpeech(std::string textToAnalyse){
    std::string word;
    int numOfNegatives = 0;
    int numOfPositives = 0;

    for(int i = 0; i < textToAnalyse.size(); i++){
        if(textToAnalyse.at(i) != ' ' && textToAnalyse.at(i) != '.' && textToAnalyse.at(i) != '?' && textToAnalyse.at(i) != '!' && textToAnalyse.at(i) != ':' && textToAnalyse.at(i) != ';'){
            word = word + textToAnalyse.at(i);
            std::cout << word << std::endl;
        }
        else{
            int positiveComp = positiveComparision(word);
            numOfPositives += positiveComp;

            int negativeComp = negativeComparision(word);
            numOfNegatives += negativeComp;

            word = "";
        }
    }

    std::cout << numOfPositives << std::endl;
    std::cout << numOfNegatives << std::endl;

    int total = 0;
    total = numOfPositives - numOfNegatives;
    std::cout << "Total: " << total << std::endl;

    return total;
}

int main(){
    std::string textToAnalyse;

    std::getline(std::cin,textToAnalyse);

    int output = valueOfSpeech(textToAnalyse);

    return output;
}
