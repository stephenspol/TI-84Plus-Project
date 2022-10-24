local lfs = require ( "lfs" )

function ReplaceExtension(str, ext)
	return string.gsub(str, "%..*$", ext)
end

function IsAssembly(filePath)
	return string.find(filePath, ".*%.asm$")
end

function Is8xp(filePath)
	return string.find(filePath, ".*%.8xp$")
end

function VisitFiles(folderPath, visitor)
    for filePath in lfs.dir (folderPath) do
		visitor(folderPath, filePath)
    end
end

function RemoveFileVisitor(folderPath, filePath)
	if (Is8xp(filePath)) then
		local ok, err = os.remove(folderPath .. "/" .. filePath)
		if (ok) then
			print("Successfully removed " .. filePath .. "")
		else
			print(err)
		end
	end
end

function BuildFileVisitor(folderPath, filePath)
	if (IsAssembly(filePath)) then
		local relativePath = folderPath.."/"..filePath
		local buildPath = ReplaceExtension(relativePath, ".8xp")

		os.execute("brass " .. relativePath .. " " .. buildPath)
		print()
	end
end

for i,lifecycle in ipairs(arg) do
	if (i > 0) then 
		if (string.lower(lifecycle) == "clean") then
			print("Cleaning out assembled files...\n")
			VisitFiles("asm/28day-tutorial", RemoveFileVisitor)

		elseif (string.lower(lifecycle) == "build") then
			print("Building assembly files...")
			VisitFiles("asm/28day-tutorial", BuildFileVisitor)

		else
			print("Unknown lifecycle " .. lifecycle)
			break

		end
	end
end