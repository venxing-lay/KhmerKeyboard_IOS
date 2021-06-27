//
//  STEKeybaordData.swift
//  STEKeyboard
//
//  Created by Sengthai Te on 26/6/21.
//

import Foundation

struct STEKeybaordData {
    
    static let mainScreenButtonData: String =
        """
{
        "button_list" : [{
          "first_col" : [],
        "middle_col": [{"title":"១", "subtitle": "1"},
            {"title":"២", "subtitle": "2"},
            {"title":"៣", "subtitle": "3"},
            {"title":"៤", "subtitle": "4"},
            {"title":"៥", "subtitle": "5"},
            {"title":"៦", "subtitle": "6"},
            {"title":"៧", "subtitle": "7"},
            {"title":"៨", "subtitle": "8"},
            {"title":"៩", "subtitle": "9"},
            {"title":"០", "subtitle": "0"},
            {"title":"ឥ", "subtitle": "ឦ"},
            {"title":"ឲ", "subtitle": "ឱ"}],
        "last_col" : []
        },
        {
                "first_col" : [],
                "middle_col" : [{"title":"ឆ", "subtitle": "ឈ"},
                    {"title":"ឹ", "subtitle": "ឺ"},
                    {"title":"េ", "subtitle": "ែ"},
                    {"title":"រ", "subtitle": "ឬ"},
                    {"title":"ត", "subtitle": "ទ"},
                    {"title":"យ", "subtitle": "ួ"},
                    {"title":"ុ", "subtitle": "ូ"},
                    {"title":"ិ", "subtitle": "ី"},
                    {"title":"ោ", "subtitle": "ៅ"},
                    {"title":"ផ", "subtitle": "ភ"},
                    {"title":"ៀ", "subtitle": "ឿ"},
                    {"title":"ឪ", "subtitle": "ឧ"}],
                    "last_col" : []
        },
        {
                "first_col" : [],
                "middle_col" : [{"title":"ា", "subtitle": "ឫ"},
                    {"title":"ស", "subtitle": "ៃ"},
                    {"title":"ដ", "subtitle": "ឌ"},
                    {"title":"ថ", "subtitle": "ធ"},
                    {"title":"ង", "subtitle": "អ"},
                    {"title":"ហ", "subtitle": "ះ"},
                    {"title":"្", "subtitle": "ញ"},
                    {"title":"ក", "subtitle": "គ"},
                    {"title":"ល", "subtitle": "ឡ"},
                    {"title":"ើ", "subtitle": "៖"},
                    {"title":"់", "subtitle": "៉"},
                    {"title":"ឮ", "subtitle": "ឭ"}],
                    "last_col" : []
        },
        {
                "first_col" : [],
                "middle_col" : [{"title":"ឋ", "subtitle": "ឍ"},
                    {"title":"ខ", "subtitle": "ឃ"},
                    {"title":"ច", "subtitle": "ជ"},
                    {"title":"វ", "subtitle": "ៈ"},
                    {"title":"ប", "subtitle": "ព"},
                    {"title":"ន", "subtitle": "ណ"},
                    {"title":"ម", "subtitle": "ំ"},
                    {"title":"ុំ", "subtitle": "ឱ"},
                    {"title":"៕", "subtitle": "។"},
                    {"title":"៊", "subtitle": "ឯ"}],
                "last_col" : [{"title":"⌫", "subtitle": null, "type" : "kt_delete"}]
        },
        {
                "first_col" : [{"title":"123", "subtitle": null, "type" : "kt_number"},
                    {"title":"⚙︎", "subtitle": null, "type" : "kt_setting"},
                    {"title":"☻", "subtitle": null, "type" : "kt_emoj"}],

                "middle_col" : [{"title":"space", "subtitle": null, "type" : "kt_space"}],

                "last_col" : [{"title":"return", "subtitle": null, "type" : "kt_return" }]
        }
        ]
    }
"""
    
}
