const {Octokit} = require("octokit");
const octokit = new Octokit();

function check(checkUpdateInfo) {

    console.log("使用 GitHub 版本检测模块");
    let owner = checkUpdateInfo.github.owner;
    let repo = checkUpdateInfo.github.repo;
    let preRelease = checkUpdateInfo.github.prerelease || false;
    const releaseInfo = octokit.request("GET /repos/{owner}/{repo}/releases", {
        owner: owner,
        repo: repo,
    });
    releaseInfo
        .then((result) => {
        });
}

module.exports = {
    check
};