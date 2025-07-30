// utils/supabase.ts
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://gtvytcgrhrelhbwogyoe.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd0dnl0Y2dyaHJlbGhid29neW9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYxMjM1MjQsImV4cCI6MjA2MTY5OTUyNH0.qigbrKn_-vhMgQi534_CxIBb542nPB2mWMX6ncipNOg'; // Get this from Supabase → Project → Settings → API

export const supabase = createClient(supabaseUrl, supabaseKey);
