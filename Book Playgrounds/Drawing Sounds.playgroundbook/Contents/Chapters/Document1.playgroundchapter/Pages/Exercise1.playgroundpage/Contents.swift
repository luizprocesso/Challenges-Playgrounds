//#-hidden-code
//
//  Contents.swift
//
//  Copyright © 2016,2017 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 Configure and play your own instruments! Follow the code comments below to find tips for modifying the audio loop and instruments to make new sounds.
 
 When you're ready, you can [try another challenge](playgrounds://featured). Good luck!
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, if, func, for, while, (, ), (), var, let, ., =, <, >, <=, >=, ==, !=, +=, +, -, true, false, &&, ||, !)
// Instrument
//#-code-completion(identifier, show, xEffect, filter, defaultVelocity, noteCount)
// InstrumentFilter
//#-code-completion(identifier, show, InstrumentFilter, type, (type:, type:, (type:), type:))
// InstrumentFilterType
//#-code-completion(identifier, show, InstrumentFilterType, alienChatter, distortion, cubedDistortion, echo, multiEcho, cathedral, smallRoom, cellphoneConcert)
// InstrumentTweak
//#-code-completion(identifier, show, InstrumentTweak, (type:effectFrom:to:, type:effectFrom:to:, (type:effectFrom:to:), type:effectFrom:to:))
// InstrumentTweakType
//#-code-completion(identifier, show, InstrumentTweakType, pitchBend, pressure, velocity)
// Loop
//#-code-completion(identifier, show, Loop, volume, pause(), stop(), play(), (type:, type:, (type:), type:)))
// LoopType
//#-code-completion(identifier, show, LoopType, aboveAndBeyond, airyVox, altPop)
// Speech
//#-code-completion(identifier, show, Speech, defaultVolume, defaultSpeed, defaultPitch, xEffect, noteCount)
// SpeechTweak
//#-code-completion(identifier, show, SpeechTweak, (type:effectFrom:to:, type:effectFrom:to:, (type:effectFrom:to:), type:effectFrom:to:))
// SpeechTweakType
//#-code-completion(identifier, show, SpeechTweakType, pitch, speed, volume)
import UIKit
import PlaygroundSupport

let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
let viewController = storyBoard.instantiateInitialViewController() as! MusicViewController

PlaygroundPage.current.liveView = viewController

// Note: These functions are not following Swift conventions but are instead trying to mimic the feel of a class for a beginner audience.
/// Creates an electric guitar.
func ElectricGuitar() -> Instrument {
    let instrument = Instrument(kind: .electricGuitar)
    instrument.connect(viewController.engine!)
    instrument.defaultVelocity = 64
    return instrument
}

/// Creates a bass guitar.
func Bass() -> Instrument {
    let instrument = Instrument(kind: .bass)
    instrument.connect(viewController.engine!)
    instrument.defaultVelocity = 64
    return instrument
}
//#-end-hidden-code
//#-editable-code
// Try other types of loops!
let loop = Loop(type: LoopType.aboveAndBeyond)
// Numbers in this playground can be from 0 to 100. Increase the volume to hear the loop.
loop.volume = 0
loop.play()

// This code configures the instrument keyboard on the left.
//#-end-editable-code
func leftSoundProducer() -> SoundProducer {
    //#-editable-code
    // Try changing the instrument to ElectricGuitar().
    let instrument = Bass()
    instrument.defaultVelocity = 80
    // Try changing the type or values for xEffect, which changes the sound depending on where you touch the keyboard.
    instrument.xEffect = InstrumentTweak(type: InstrumentTweakType.velocity, effectFrom: 50, to: 100)
    // Try another filter, such as multiEcho.
    instrument.filter = InstrumentFilter(type: InstrumentFilterType.cathedral)
    return instrument
    //#-end-editable-code
}
//#-editable-code
// This code configures the voice keyboard on the right.
//#-end-editable-code
func rightSoundProducer() -> SoundProducer {
    //#-editable-code
    // Put your own words here.
    let speech = Speech(words: "Here's to the crazy ones.")
    speech.defaultSpeed = 30
    speech.defaultVolume = 60
    // Try changing the type to speed to see how it impacts the sound.
    speech.xEffect = SpeechTweak(type: SpeechTweakType.pitch, effectFrom: 0, to: 100)
    return speech
    //#-end-editable-code
}
//#-hidden-code
viewController.makeLeftSoundProducer = leftSoundProducer
viewController.makeRightSoundProducer = rightSoundProducer
//#-end-hidden-code
