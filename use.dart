     if (userStatus == UserStatus.buyer.title) {
                                idCardText = MockupData.idCardText;
                                idCardPhotoBase64 = MockupData.faceId;
                                // idCardPhotoBase64 = isSimulator
                                //     ? MockupData.faceId
                                //     : userInformationModel.imageUrl;
                                convertIdCardData(
                                    idCardText, idCardPhotoBase64);
                                userIdCardNumber =
                                    userInformationModel.idNumber;
                                userMobileNumber =
                                    userInformationModel.phoneNumber;
                              }



         try {
                                var _result =
                                    await IDReaderServices().readCard();
                                idCardText = _result[0];
                                idCardPhotoBase64 = _result[1];
                                // debugPrint('-------idCardText------');
                                // debugPrint(idCardText);
                                convertIdCardData(
                                    idCardText, idCardPhotoBase64);
                                userIdCardNumber =
                                    userInformationModel.idNumber;
                              }  

convertIdCardData(String idCardData, String idCardPhotoBase64) {
    // debugPrint('idCardData = $idCardData');
    List<String> listIdCardData = idCardData.split('#');
    userInformationModel = listIdCardData.getUserInformation(
        imageUrl: idCardPhotoBase64.replaceAll('\n', ''));
    // debugPrint('listIdCardData = $listIdCardData');
    userInformationModel.houseNumber = listIdCardData[9];
    userInformationModel.moo = listIdCardData[10];
    userInformationModel.street = listIdCardData[12];
    userInformationModel.road = listIdCardData[13];
    userInformationModel.subDistrict = listIdCardData[14];
    userInformationModel.district = listIdCardData[15];
    userInformationModel.province = listIdCardData[16];

    if (userStatus == UserStatus.carUserNumber.title) {
      nameAndSurNameCarUse =
          listIdCardData[1] + listIdCardData[2].addSpace(1) + listIdCardData[4];
    } else if (userStatus == UserStatus.buyer.title) {
      nameAndSurNameBuyYer =
          listIdCardData[1] + listIdCardData[2].addSpace(1) + listIdCardData[4];
    }
  }




