// global.d.ts
declare global {
  interface Window {
      voiceflow: any;  // Adjust type 'any' based on the actual structure of the voiceflow object
  }
}

export {};  // To make it a module, so it can be used in other files
