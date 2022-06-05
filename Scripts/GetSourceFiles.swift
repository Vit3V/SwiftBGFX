#!/usr/bin/env swift
//
//  File.swift
//  
//
//  Created by Vitalijs Vasilevskis on 25/05/2022.
//

import Foundation
import FileProvider

let currentDirectory = FileManager.default.currentDirectoryPath

func getAllFiles(at path: String) -> [String] {
    
    var items = try! FileManager.default.contentsOfDirectory(atPath: path).map { "\(path)/\($0)" }
    let dirs = items.filter { item in
        var isDirectory: ObjCBool = false
        let exists = FileManager.default.fileExists(atPath: item, isDirectory: &isDirectory)
        return exists && isDirectory.boolValue == true
    }
    items.removeAll(where: { dirs.contains($0) })
    dirs.forEach { dir in
        items.append(contentsOf: getAllFiles(at: dir))
    }
    
    return items
}

guard
    CommandLine.arguments.count > 1
else {
    exit(1)
}

let sourceExtensions = ["mm", "cpp", "c"]
let path = "\(currentDirectory)/\(CommandLine.arguments[1])"
let files = getAllFiles(at: path)
    .filter {
        if let ext = $0.split(separator: ".").last {
            return !sourceExtensions.contains(String(ext))
        }
        return false
    }
    .map { file in
        file
            .replacingOccurrences(of: "\(path)/", with: "")
            .replacingOccurrences(of: path, with: "")
    }
    .reduce(into: "") { result, file in
        return result += "\"\(file)\",\n"
    }

let fileName = CommandLine.arguments[1].replacingOccurrences(of: "/", with: "_")
FileManager.default.createFile(atPath: "\(path)/sources.files", contents: files.data(using: .utf8))
