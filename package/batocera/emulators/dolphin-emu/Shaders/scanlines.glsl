/*
[configuration]

[OptionRangeFloat]
GUIName = Blur Area
OptionName = BLUR_SIZE
MinValue = 0.0
MaxValue = 10.0
StepAmount = 0.1
DefaultValue = 1.6

[OptionRangeFloat]
GUIName = Scanline Alpha
OptionName = SEPARATOR_ALPHA
MinValue = 0.0
MaxValue = 1.0
StepAmount = 0.05
DefaultValue = 0.15

[OptionRangeFloat]
GUIName = Scanline Width
OptionName = SCANLINE_SIZE
MinValue = 0.0
MaxValue = 64
StepAmount = 0.1
DefaultValue = 6.3

[OptionRangeFloat]
GUIName = Brightness Boost
OptionName = BRIGHTNESS_BOOST
MinValue = 0.0
MaxValue = 2.0
StepAmount = 0.01
DefaultValue = 1.25

[/configuration]
*/

void main()
{
	const float PI = 3.1415926535897932384626433832795;
	float4 c0 = Sample();
	float blursize = GetOption(BLUR_SIZE);
	float subtleLevel = GetOption(SEPARATOR_ALPHA); // 0 is very dark separator, 1 is no separator
	float scanlineSize = GetOption(SCANLINE_SIZE);
	float boost = GetOption(BRIGHTNESS_BOOST);
	
	//blur
	float4 blurtotal = float4(0.0, 0.0, 0.0, 0.0);
	blurtotal += SampleLocation(GetCoordinates() + float2(-blursize, -blursize) * GetInvResolution());
	blurtotal += SampleLocation(GetCoordinates() + float2(-blursize, blursize) * GetInvResolution());
	blurtotal += SampleLocation(GetCoordinates() + float2( blursize, -blursize) * GetInvResolution());
	blurtotal += SampleLocation(GetCoordinates() + float2( blursize, blursize) * GetInvResolution());
	blurtotal += SampleLocation(GetCoordinates() + float2(-blursize, 0.0) * GetInvResolution());
	blurtotal += SampleLocation(GetCoordinates() + float2( blursize, 0.0) * GetInvResolution());
	blurtotal += SampleLocation(GetCoordinates() + float2( 0.0, -blursize) * GetInvResolution());
	blurtotal += SampleLocation(GetCoordinates() + float2( 0.0, blursize) * GetInvResolution());
	blurtotal *= 0.125;
	c0 = blurtotal;

	// get color factor intensity based on vertical pixel position
	// coordinates are 0 to 1 while resolution is a pixel resolution
	float vPos = GetCoordinates().y * GetWindowResolution().y;
	float lineIntensity = subtleLevel + abs(cos(PI / scanlineSize * vPos));
	
	
	// output
	SetOutput(c0 * clamp(lineIntensity, 0.0, 1.125) * boost);
}
