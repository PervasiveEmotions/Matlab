#include <iostream>
#include <cmath>

int positivityDetermination(int text){              //This function determines the positivity degree of the text and the voice
    int emotionPositivity = 0;                      //of the user.

    if(text >= 2){                                  //The text has been classified in three states, positive, negative and neutral.
        emotionPositivity += 2;                     //The positivity index is here looked upon and determines the weight of its positivity
    }                                               //2 or -2 for very positive or very negative and 1 or -1 for negative or positive.
    else if(text < 2 && text > 0){                  //0 corresponds again to neutral.
        emotionPositivity += 1;
    }
    else if(text <= -2){
        emotionPositivity -= 2;
    }
    else if(text > -2 && text < 0){
        emotionPositivity -= 1;
    }
    else{
        emotionPositivity += 0;
    }                                               
                                                    //All values found in the text joint in the emotionPositivity
                                                    //variable, which can go from -2 to 2 in negativeness or positivity.
    return emotionPositivity;                       //The functions then returns this overall positivity value.
}

int positivityAnalysis(int emotionPositivity, int voice){   //This function analyses the overall positivity and links it to the voice
    int emotionID = 0;                                      //value (representing a general emotion).

    if(emotionPositivity < -1){                             //If the overall positiity value is more than 1 or less than -1,
        emotionID -= voice;                                 //the speech's positivity is considered important and affects
    }                                                       //the final qualification of the emotion of the user.
    else if(emotionPositivity > 1){
        emotionID += voice + 6;                             //The function returns a variable named emotionID which
    }                                                       //is a number corresponding to an emotion's state that are listed
    else{                                                   //in the next function.
        emotionID = voice;
    }

    return emotionID;
}

std::string mergeResults(int text, int voice){                      //This function is the main one because it calls the other two.
    std::string emotionName;                                        //It returns the name of the emotion's state following the 
                                                                    //emotionID variable which is compared to all emotions listed
    int emotionPositivity = positivityDetermination(text);          //below
    int emotionID = positivityAnalysis(emotionPositivity, voice);

    switch (emotionID)
    {
    case -6:
        emotionName = "very fearful";
        break;
    case -5:
        emotionName = "very angry";
        break;
    case -4:
        emotionName = "very sad";
        break;
    case -3:
        emotionName = "slightly happy";
        break;
    case -2:
        emotionName = "very disgusted";
        break;
    case -1:
        emotionName = "negative neutral";
        break;
    case 1:
        emotionName = "neutral";
        break;
    case 2:
        emotionName = "disgusted";
        break;
    case 3:
        emotionName = "happy";
        break;
    case 4:
        emotionName = "sad";
        break;
    case 5:
        emotionName = "angry";
        break;
    case 6:
        emotionName = "fearful";
        break;
    case 7:
        emotionName = "positive neutral";
        break;
    case 8:
        emotionName = "slightly disgusted";
        break;
    case 9:
        emotionName = "very happy";
        break;
    case 10:
        emotionName = "slightly sad";
        break;
    case 11:
        emotionName = "slightly angry";
        break;
    case 12:
        emotionName = "slightly fearful";
        break;
    default:
        emotionName = "no emotion found";
        break;
    }

    return emotionName;
}

int main(){
    int voice = 0;
    int text = 0;

    std::cin >> text;
    std::cin >> voice;

    std::cout << mergeResults(text, voice) << std::endl;

    return 0;
}
