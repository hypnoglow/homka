# Homka :hamster:

This is a toolbox that allows you to do some little [CI](https://en.wikipedia.org/wiki/Continuous_integration)-magic for your simple website.

## Use case

For example, Homka is useful in the management of backend processes of 
your wordpress blog. :monkey_face:  

Deploy a website on your local machine. Do some coding.
Then use this toolbox to build and deploy your new code to the server. 
Homka takes upon oneself some routines like
"dump actual MySQL data from server" or "pull fresh image uploads".

## Usage

Common pattern:

    ./homka [action] [options]

Get help:

    ./homka help
    ./homka [action] --help