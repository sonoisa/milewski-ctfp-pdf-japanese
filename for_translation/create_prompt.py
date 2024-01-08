import sys
import re


def load_dictionary(dict_file):
    dictionary = {}
    with open(dict_file, 'r', encoding='utf-8') as file:
        for line in file:
            if line.startswith("- "):
                word, definition = line[2:].split(": ", 1)
                dictionary[word.strip().lower()] = line.strip()
    return dictionary

def find_definitions(text, dictionary):
    examples = ""
    text = text.lower()
    for word in dictionary:
        if word in text:
            examples += f"{dictionary[word]}\n"
    return examples

def delete_lettrine_commands(text):
    pattern = r'\\lettrine(?:\[[^\]]*\])?\{([^}]*)\}\{([^}]*)\}'
    
    def replacer(match):
        return f"{match.group(1)} {match.group(2)}"
    
    return re.sub(pattern, replacer, text)

def main():
    if len(sys.argv) != 3:
        print("Usage: python script.py <text_file> <dictionary_file>")
        sys.exit(1)

    text_file = sys.argv[1]
    dict_file = sys.argv[2]

    dictionary = load_dictionary(dict_file)

    with open(text_file, 'r', encoding='utf-8') as file:
        text = file.read()
        text = delete_lettrine_commands(text).strip()
        examples = find_definitions(text, dictionary)

    print(f'''次の圏論とプログラミング言語に関するTeXコードを制約条件と翻訳例に従って自然かつ綺麗な日本語に翻訳してください。

# 制約条件
- 日本語として自然かつ綺麗な表現になるようにしてください。
- 説明は省略して翻訳結果のみを出力してください。
- 翻訳例にある単語はそれに従って翻訳してください。
- TeXのコマンドとプログラムは翻訳しないでください。
- 元々あったTeXコマンドは翻訳によって削除しないでください。

# 翻訳例
{examples}

# 英語のTeXコード
"""
{text}
"""

# 日本語のTeXコード (自然かつ綺麗な日本語表現) ''')

if __name__ == "__main__":
    main()
