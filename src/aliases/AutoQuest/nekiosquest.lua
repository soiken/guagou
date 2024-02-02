if currentQuest == nil then
    currentQuest = "ALAQSII_ANIMALS" -- or any quest key you want to start
    currentStep = 1
    executeCurrentStep()
  else
    print("A quest is already in progress.")
  end