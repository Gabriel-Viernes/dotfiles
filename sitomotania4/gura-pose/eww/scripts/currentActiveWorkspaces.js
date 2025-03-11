const { execSync } = require('child_process')

let workspaces;
let active;
let activeWorkspaces;

while(true) {
    workspaces = execSync("hyprctl -j workspaces", { encoding: 'utf8' });
    workspaces = JSON.parse(workspaces);

    active = execSync("hyprctl -j activeworkspace", { encoding: 'utf8'});
    active = JSON.parse(active);

    activeWorkspaces = [active.id, false, false, false, false, false, false, false, false, false, false]

    for(let i = 0; i < workspaces.length; i++) {
        activeWorkspaces[workspaces[i].id] = true
    }
 
    activeWorkspaces = JSON.stringify(activeWorkspaces)
    console.log(activeWorkspaces)
}


