void main()
{
	float currentMillis = GetTime() / float(1000.0);
	float2 coords = GetCoordinates();
	float lineCount = GetWindowResolution().y / 2.0;

    // scanlines
    int lineIndex = int( ( coords.y + currentMillis * 0.5 ) * lineCount );
#ifdef API_OPENGL
    float lineIntensity = mod(float(lineIndex), 2);
#elif API_VULKAN
    float lineIntensity = mod(float(lineIndex), 2);
#else
	float lineIntensity = float(lineIndex) % 2.0;
#endif
    // color shift
    float off = lineIntensity * 0.0005;
    float4 shift = float4( off, 0, 0, 0 );
    
    // shift R and G channels to simulate NTSC color bleed
    float4 colorShift = float4( 0.001, 0, 0, 0 );
    float r = (Sample() + colorShift + shift).x;
    float g = (Sample() - colorShift + shift).y;
    float b = Sample().z;
    
    float4 c = float4( r, g * 0.99, b, 1.0 ) * clamp( lineIntensity, 0.85, 1.0 );
    
    float rollbar = sin( ( coords.y + currentMillis ) * 4.0 );
    
	SetOutput(c + (rollbar * 0.02));
}
