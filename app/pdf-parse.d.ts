declare module 'pdf-parse' {
    interface PDFMetadata {
      title?: string;
      author?: string;
      subject?: string;
      keywords?: string;
      producer?: string;
      creator?: string;
      creationDate?: string;
      modDate?: string;
      trapped?: string;
    }
  
    interface PDFText {
      text: string;
      metadata?: PDFMetadata;
    }
  
    function pdf(buffer: Buffer): Promise<PDFText>;
  
    export = pdf;
  }
  