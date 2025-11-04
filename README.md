# 🧩 Remove unused Tags and Update some that are not used anymore

**Category:** Citrix / PowerShell 
**Date:** 11/26 
**Tags:** PowerShell, Automation,Citrix Studio, Tags.

---

## 🧠 Overview

With the transition of the infrastracture to windows 11 there where a lot of unused tags.
The exercise was to remove them.

---

## 💡 Problem Solved

Common Problems before: 
- Example: Time consuming cleanup of Citrix Studio
- Example: Usually Confusing when try to create new Desktop or Applications

---

## ⚙️ Environment

Citrix PVS, Windows 11,
| Tools Used | PowerShell 5.1

---

## 🧾 How It Works

1. Get all the tags tha exist in your environment (ex : Get-BrokerTag, get-BrokererMachine -Tag $tag.Name)
2. Get the sum of each tag
3. Create a table and populate data
