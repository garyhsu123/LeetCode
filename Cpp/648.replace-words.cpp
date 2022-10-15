/*
 * @lc app=leetcode id=648 lang=cpp
 *
 * [648] Replace Words
 */

#include <vector>
#include <string>
#include <iostream>
#include <sstream>
using namespace std;


// @lc code=start
struct CharDictionary {
    CharDictionary *alphebet[26];
    bool isEnd;
    CharDictionary(): isEnd(false) {
        for(int i=0; i<26; i++) this->alphebet[i]= NULL;
    }

};


class Solution {
public:
    string replaceWords(vector<string>& dictionary, string sentence) {
        CharDictionary *dict = new CharDictionary();
       
        for (string word: dictionary) {
            CharDictionary *tmp = dict;
            for (char c: word) {
                
                if (tmp->alphebet[c-'a'] == nullptr) {
                    tmp->alphebet[c-'a'] = new CharDictionary();
                }
                
                tmp = tmp->alphebet[c-'a'];
                
            }
            tmp->isEnd = true;
        }

        
        istringstream str;
        str.str(sentence);
        string text;
        string output = "";
        while(str >> text) {
            CharDictionary *tmp = dict;
            string tmpstr = "";
            for (char c: text) {
                if (tmp->isEnd) {
                    break;
                }
                if (tmp->alphebet[c-'a'] != nullptr) {
                    tmpstr += c;
                    tmp = tmp->alphebet[c-'a'];
                }
                else {
                    break;
                }
            }
            if (!tmp->isEnd){
            output += text;
            output += " ";
            } else {
                output += tmpstr;
                output += " ";
            }
        }
        return output.substr(0,output.size()-1);
    }
};
// @lc code=end

