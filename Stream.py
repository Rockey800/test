import asyncio
import cv2
from aiortc import RTCPeerConnection, VideoStreamTrack
import json

# Free demo video (Big Buck Bunny short version)
VIDEO_PATH = "https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4"

class CloudStream(VideoStreamTrack):
    def __init__(self):
        super().__init__()
        self.cap = cv2.VideoCapture(VIDEO_PATH)

    async def recv(self):
        pts, time_base = await self.next_timestamp()
        ret, frame = self.cap.read()
        if not ret:
            self.cap.set(cv2.CAP_PROP_POS_FRAMES, 0)
            ret, frame = self.cap.read()
        return frame

async def main():
    pc = RTCPeerConnection()
    pc.addTrack(CloudStream())

    print("🔥 Ultra-Light Demo Stream started")
    offer = await pc.createOffer()
    await pc.setLocalDescription(offer)
    print("📋 COPY THIS OFFER TO iPhone BROWSER:")
    print(json.dumps({"type": pc.localDescription.type, "sdp": pc.localDescription.sdp}))

    while True:
        await asyncio.sleep(1)

asyncio.run(main())
