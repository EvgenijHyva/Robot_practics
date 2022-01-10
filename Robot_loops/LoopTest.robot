*** Settings ***
Documentation         Loops exapmle
Default Tags    LoopsTest

*** Variables ***
@{robots}        Benter     Johny    Terminator    Robocop
${MAX_TRIES}=     ${50}
${NUMBER_TO_PASS_ON}=    7

*** Test Cases ***
loopsTest1
    [Tags]    ListCreationOnPlace
    @{list}=    Create List    one    two    three
    FOR     ${item}     IN     @{list}
        Log    ${item}
    END
    
LoopOverRobots
    [Tags]    Robots
    FOR     ${rob}    IN       @{robots}
        Log    ${rob}
    END
    
LoopBreakCondition
    [Tags]    RobotsFind
    FOR    ${robot}    IN     @{robots}
        exit for loop if    $robot == "Johny"
        Log    ${robot}
    END
    
Executeonlythreetimes
    [Tags]    ContinueIfTrue
    FOR    ${robot}    IN    @{ROBOTS}
        Continue For Loop If    $robot == 'Terminator'
        Log    ${robot}
    END

Executetwotimes
    [Tags]    Indexing
    ${index}=    Set Variable    1
    FOR    ${robot}    IN    @{ROBOTS}
        Exit For Loop If    ${index} > 2
        Log    ${robot}
        ${index}=    Evaluate    ${index} + 1
    END
    
IF_ELSE_Conditions
    [Tags]    IF_ELSE_IF_ELSE
    FOR    ${i}    IN RANGE    ${MAX_TRIES}
        ${random}=    Evaluate    random.randint(0, 10)
        IF    ${random} == ${NUMBER_TO_PASS_ON}
        Pass Execution    "${random} == ${NUMBER_TO_PASS_ON}"
        ELSE IF    ${random} > ${NUMBER_TO_PASS_ON}
        Log To Console    Too high.
        ELSE
        Log To Console    Too low.
        END
    END