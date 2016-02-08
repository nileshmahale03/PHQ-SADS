//
//  DataSource.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/10/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class DataSource: NSObject {

    var phq9Test: PHQTest = PHQTest(
        questions: [
        "Over the last 2 weeks, how often have you been bothered by any of the following problems? \n" + "Little interest or pleasure in doing things.",
        "Feeling down, depressed, or hopeless.",
        "Trouble falling or staying asleep, or sleeping too much.",
        "Feeling tired or having little energy.",
        "Poor appetite or overeating.",
        "Feeling bad about yourself — or that you are a failure or have let yourself or your family down.",
        "Trouble concentrating on things, such as reading the newspaper or watching television.",
        "Moving or speaking so slowly that other people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual.",
        "Thoughts that you would be better off dead or of hurting yourself in some way."],
        diagnosis: [
        "Minimal Depression",
        "Mild depression",
        "Moderate depression",
        "Moderately severe depression",
        "Severe depression",
        "Diagnosis"],
        title:
        "PHQ-9",
        options: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly everyday"])
    
    var gad7Test: PHQTest = PHQTest(
        questions: [
        "Over the last 2 weeks, how often have you been bothered by the following problems? \n" + "Feeling nervous, anxious, or on edge.",
        "Not being able to stop or control worrying.",
        "Worrying too much about different things.",
        "Trouble relaxing.",
        "Being so restless that it's hard to sit still.",
        "Becoming easily annoyed or irritable.",
        "Feeling afraid as if something awful might happen."],
        diagnosis: [
        "Minimal anxiety",
        "Mild anxiety",
        "Moderate anxiety",
        "Moderately severe anxiety",
        "Severe anxiety",
        "Diagnosis"],
        title:
        "GAD-7",
        options: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly everyday"])
    
    var phq15Test: PHQTest = PHQTest(
        questions: [
        "During the last 4 weeks, how much have you been bothered by any of the following problems? \n" + "Stomach pain.",
        "Back pain.",
        "Pain in your arms, legs, or joints (knees, hips, etc.).",
        "Feeling tired or having little energy.",
        "Trouble falling or staying asleep, or sleeping too much.",
        "Menstrual cramps or other problems with your periods.",
        "Pain or problems during sexual intercourse.",
        "Headaches.",
        "Chest pain.",
        "Dizziness.",
        "Fainting spells.",
        "Feeling your heart pound or race.",
        "Shortness of breath.",
        "Constipation, loose bowels, or diarrhea.",
        "Nausea, gas, or indigestion."],
        diagnosis: [
        "Minimal Anxiety",
        "Mild Anxiety",
        "Moderate Anxiety",
        "Moderately severe Anxiety",
        "Severe Anxiety",
        "Diagnosis"],
        title:
        "PHQ-15",
        options: [
        "Not bothered",
        "Bothered a little",
        "Bothered a lot",
        ""])

    var panicSymptomsTest: PHQTest = PHQTest(
        questions: [
            "In the last 4 weeks, have you had an anxiety attack ⎯ suddenly feeling fear or panic?",
            "Has this ever happened before?",
            "Do some of these attacks come suddenly out of the blue ⎯ that is, in situations where you don’t expect to be nervous or uncomfortable?",
            "Do these attacks bother you a lot or are you worried about having another attack?",
            "During your last bad anxiety attack, did you have symptoms like shortness of breath, sweating, or your heart racing, pounding or skipping?"],
        diagnosis: [
            "Minimal anxiety",
            "Mild anxiety",
            "Moderate anxiety",
            "Moderately severe anxiety",
            "Severe anxiety",
            "Diagnosis"],
        title:
        "Panic Symptoms",
        options: [
            "NO",
            "YES",
            "",
            ""])
    
    var currentTest: PHQTest?
    
    var currentAnswerSet: [Int]?
    
    class var sharedInstance: DataSource {
        
        struct Singleton {
            
            static let instance = DataSource()
        }
        
        return Singleton.instance
    }

}
