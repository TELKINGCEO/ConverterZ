// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@zama-fhevm/contracts/FHE.sol";

contract ImageConverterFHE {
    struct Image {
        ebytes data;
        euint8 format; // 0 = JPG, 1 = PNG
        address owner;
    }

    uint256 public imageCount;
    mapping(uint256 => Image) private images;

    modifier onlyOwner(uint256 id) {
        require(images[id].owner == msg.sender, "Not owner");
        _;
    }

    function uploadImage(ebytes calldata encryptedData, euint8 encryptedFormat) external {
        images[++imageCount] = Image(encryptedData, encryptedFormat, msg.sender);
    }

    function requestConvert(uint256 id) external onlyOwner(id) {
        images[id].format = FHE.sub(FHE.asEuint8(1), images[id].format);
    }

    function getEncryptedImage(uint256 id)
        external
        view
        onlyOwner(id)
        returns (ebytes memory, euint8)
    {
        Image storage img = images[id];
        return (img.data, img.format);
    }
}

