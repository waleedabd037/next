import axios from 'axios';
import readline from 'readline';

const apiKey: string = 'YOUR_NEW_API_KEY'; 

interface VoiceflowRequest {
    type: string;
    payload?: string;
}

interface Trace {
    type: string;
    payload: {
        message: string;
    };
}

const interact = async (userId: string, request: VoiceflowRequest): Promise<void> => {
    try {
        const response = await axios.post<Trace[]>(
            `https://general-runtime.voiceflow.com/state/user/${userId}/interact`, // Corrected URL with backticks
            { request },
            {
                headers: {
                    Authorization: apiKey,
                    versionID: 'production',
                    Accept: 'application/json',
                    'Content-Type': 'application/json',
                },
            }
        );

        const traces = response.data;
        for (const trace of traces) {
            if (trace.type === 'text') {
                console.log(trace.payload.message);
            }
        }
    } catch (error: any) {
        console.error('Error interacting with Voiceflow:', error.message);
    }
};

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

const startConversation = async (): Promise<void> => {
    rl.question('> Enter your name:\n', async (name) => {
        console.log(`Starting conversation for user: ${name}`); // Corrected string interpolation
        await interact(name, { type: 'launch' });

        const chatLoop = () => {
            rl.question('> Your message:\n', async (userInput) => {
                if (userInput.toLowerCase() === 'exit') {
                    console.log('Ending conversation. Goodbye!');
                    rl.close();
                    process.exit();
                }
                await interact(name, { type: 'text', payload: userInput });
                chatLoop(); // Recur for the next message after processing the current one
            });
        };

        chatLoop(); // Start the message loop
    });
};

startConversation();
