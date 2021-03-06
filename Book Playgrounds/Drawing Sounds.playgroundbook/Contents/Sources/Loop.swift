// 
//  Loop.swift
//
//  Copyright © 2016,2017 Apple Inc. All rights reserved.
//

import AVFoundation

/**
 An enum of different loop types.
 These can be airyVox, aboveAndBeyond, and altPop.
  - localizationKey: LoopType
 */
public enum LoopType {
    case airyVox, aboveAndBeyond, altPop
    
    var loopURL: URL {
        let fileName: String
        
        switch(self) {
        case .airyVox:
            fileName = "Airy Vox Synth"
        case .aboveAndBeyond:
            fileName = "Above And Beyond Synth"
        case .altPop:
            fileName = "Alt Pop Acoustic 03"
        }
        
        return Bundle.main.url(forResource: fileName, withExtension: "caf")!
    }
}

/// This is a class to play an audio loop.
/// - localizationKey: Loop
public class Loop {
    
    private var type: LoopType
    
    private let player: AVAudioPlayer?
    
    /// Create and load a loop.
    /// - localizationKey: Loop(type:)
    public init(type: LoopType) {
        self.type = type
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: type.loopURL)
            audioPlayer.volume = Float(_volume.clamped) / Float(Constants.maxUserValue)
            audioPlayer.numberOfLoops = -1
            self.player = audioPlayer
        } catch {
            print("An error occured loading the loop \(type.loopURL)")
            self.player = nil
        }
    }

    private var _volume = ClampedInteger(clampedUserValueWithDefaultOf: 30) {
        didSet {
            player?.volume = Float(_volume.clamped) / Float(Constants.maxUserValue)
        }
    }
    /// How loud the loop is between 0 and 100.
    /// - localizationKey: Loop.volume
    public var volume: Int {
        get { return _volume.clamped }
        set { _volume.clamped = newValue }
    }

    /// Pause the loop.
    /// - localizationKey: Loop.pause()
    public func pause() {
        player?.pause()
    }
    
    /// Stop the loop.
    /// - localizationKey: Loop.stop()
    public func stop() {
        player?.stop()
    }
    
    /// Play the loop.
    /// - localizationKey: Loop.play()
    public func play() {
        player?.play()
    }
}
