local resources = ju.reborn_inventory.resources

resources.fonts = {
    'resource/fonts/Montserrat-Black.ttf',
    'resource/fonts/Montserrat-BlackItalic.ttf',
    'resource/fonts/Montserrat-Bold.ttf',
    'resource/fonts/Montserrat-BoldItalic.ttf',
    'resource/fonts/Montserrat-ExtraBold.ttf',
    'resource/fonts/Montserrat-ExtraBoldItalic.ttf',
    'resource/fonts/Montserrat-ExtraLight.ttf',
    'resource/fonts/Montserrat-ExtraLightItalic.ttf',
    'resource/fonts/Montserrat-ExtraLightItalic.ttf',
    'resource/fonts/Montserrat-Italic.ttf',
    'resource/fonts/Montserrat-Light.ttf',
    'resource/fonts/Montserrat-LightItalic.ttf',
    'resource/fonts/Montserrat-Medium.ttf',
    'resource/fonts/Montserrat-MediumItalic.ttf',
    'resource/fonts/Montserrat-Regular.ttf',
    'resource/fonts/Montserrat-SemiBold.ttf',
    'resource/fonts/Montserrat-Thin.ttf',
    'resource/fonts/Montserrat-ThinItalic.ttf',
}

if SERVER then

    for _, v1 in ipairs(resources) do

        for _, v2 in ipairs(v1) do
            resource.AddFile(v2)
        end
        
    end
    
end
