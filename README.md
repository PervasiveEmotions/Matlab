# Matlab


This project is used as the brains of our application. We need two main functionalities to be written in this program. 


### Emotion analyzation from the voice

This function gets an audio file as a parameter and an id to save the results as. Firstly the emotion is analyzed by converting into a spectogram and doing the neccesary actions to determine the emotion from the audio file. Then the result should be written into a file using the id number given as a parameter. 

For example, determineEmotionVoice(voice= voice file directory, id= filename to insert results in)
When we run determineEmotionVoice("./sound123.mp3", "abc"); => the script should create abc_voice.txt and parse in the emotion inside it.

### Emotion analyzation from the text

This function gets an string as the text and an id to save the results as. Firstly the text is analyzed by converting by doing the neccesary actions to determine the emotion from the string given as a parameter. Then the result should be written into a file using the id number given as a parameter. 

For example, determineEmotionText(text = string, id= filename to insert results in)
When we run determineEmotionVoice("./sound123.mp3", "abc"); => the script should create abc_text.txt and parse in the emotion inside it.


### Emotion estimate from the outcomes of the previous functions

The function should recieve values from the values sent before and analyze the estimate overall emotions.

