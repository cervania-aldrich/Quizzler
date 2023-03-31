struct Constants {
    
    static let optionButtonFont = "Avenir Next"
    static let renalString = "Renal"
    static let rhuematologyString = "Rhuematology"
    static let alertTitle = "Select Topic"
    static let alertMessage = "What type of questions do you want to review?"
    
    struct Renal {
        
        struct Q1 {
            static let title = "Nocturia"
            static let question = "A 21-year old woman complains of urinary frequency, nocturia, consipation and polydipsia. Her symptoms started 2 weeks ago and prior to this she would urinate twice a day and never at night. She has also noticed general malaise and some pain in her left flank. A urine dipstick is normal. The most appropriate investigation is:"
            static let answers = ["Serum phosphate", "Serum calcium", "Parathyroid hormone (PTH)", "Plasma glucose", "Serum potassium"]
            static let correctAnswer = "Serum calcium"
        }
        
        struct Q2 {
            static let title = "Breathlessness"
            static let question = "A 58 year-old man presents with breathlessness, he reports feeling unwell over the last three months with nausea, vomiting and difficulty breathing. You notice his ankles are swollen and he has bruises on his arms. The patient mentions he has not been urinating as often as normal. The most appropriate investigation is:"
            static let answers = ["Urine microscopy", "Renal ultrasound", "Serum electrolytes, urea and creatinine", "Renal biospy", "Chest x-ray"]
            static let correctAnswer = "Serum electrolytes, urea and creatinine"
        }
        
        struct Q3 {
            static let title = "Proteinuria"
            static let question = "A 55-year old woman is seen in a clinic, she has a ten-year history of type 2 diabetes treated with glibenclamide. Her blood pressure is 148/93 with new onset proteinuria, her serum results show elevated lipid levels, glycated hemoglobin of 5.5% and fasting glucose of 6.0mmol/L. A renal biopsy shows the presence of Kimmelstiel-Wilson lesions. The most appropriate management is:"
            static let answers = ["Increase oral hypoglycaemic dosage", "Angiotensin II receptor agonist (or blocker)", "Start cholesterol lowering therapy", "Start ACE inhibitors", "Start renal dialysis"]
            static let correctAnswer = "Start ACE inhibitors"
        }
        
        struct Q4 {
            static let title = "Abdominal Pain"
            static let question = "A 24-year old man presents with a four-month history of abdominal pain which has been getting worse. The patient describes the pain as generalized, dull in character and does not radiate but often occurs alongside loin pain. An irregular mass is palpable in both flanks and a mid-systolic click can be auscultated. The most appropriate investigation is:"
            static let answers = ["MRI scan","Abdominal US scan","Excretion urography", "CT scan","Abdominal x-ray"]
            static let correctAnswer = "Abdominal US scan"
            
        }
        
        struct Q5 {
            static let title = "Weight-loss"
            static let question = "A 52-year old man complains of a 3-week history of malaise and shortness of breath. He has lost weight in the last few months but attributes this to a loss of appetite possibly due to stress at work. On examination, he has a palpable mass in the right lumbar region. He has no urinary symptoms. However, the urine dipstick detected blood. The most likely diagnosis is:"
            static let answers = ["Renal abscess", "Renal cyst", "Renal carcinoma", "Adrenal tumour", "Pyelonephritis"]
            static let correctAnswer = "Renal carcinoma"
        }
    }
    
    //Add Cardiovascular struct here
    
    //Add Rhuematology struct here
    
    struct Rhuematology {
        
        struct Q1 {
            static let title = "Stiff hands (1)"
            static let question = "A 36-year-old woman presents to the rheumatology outpatient clinic with a two-month history of stiff hands and wrists. She mentions that the pain is particularly bad for the first few hours after waking up and is affecting her work as a dentist. On examination, the wrists, metacarpophalangeal joints and proximal interphalangeal joints are swollen and warm. What is the most likely diagnosis?"
            static let answers = ["Rheumatoid arthritis","Osteoarthritis", "Septic arthritis","Polymyalgia rheumatica", "Reactive arthritis"]
            static let correctAnswer = "Rheumatoid arthritis"
        }
        struct Q2 {
            static let title = "Stiff hands (2)"
            static let question = "A 45-vear-old woman presents to the rheumatology outpatient clinic with a three-month history of stiff hands and wrists. She mentions that the pain is particularly bad first thing in the morning. On examination, the wrists, metacarpophalangeal joints and proximal interphalyngeal joints are swollen and warm. A diagnosis of rheumatoid arthritis is suspected. Which of the following investigations is most specific for confirming the diagnosis?"
            static let answers = ["X-ray", "Rheumatoid factor levels", "Anti-citrullinated peptide antibody (anti-CCP) levels", "C-reactive protein", "Erythrocyte sedimentation rate"]
            static let correctAnswer = "Anti-citrullinated peptide antibody (anti-CCP) levels"
        }
        struct Q3 {
            static let title = "Stiff hands (3)"
            static let question = "A 40-year-old woman presents to the rheumatology outpatient clinic with a three month history of stiff hands and wrists. She mentions that the pain is particularly had first thing in the morning. On examination, the wrists, metacarpophalangeal Joints and proximal interphalangeal joints are swollen and warm. A diagnosis of rheumatoid arthritis is suspected, Blood tests for rheumatoid factor return as positive. What is the most appropriate management?"
            static let answers = ["Non-steroidal anti-inflammatory drugs (NSAIDs)", "Intramuscular depot injection of methylprednisolone plus NSAIDS", "Anti-TNF therapy", "Intramuscular depot injection of methylprednisolone plus NSAIDs and methotrexate and sulfasalazine", "Physiotherapy"]
            static let correctAnswer = "Non-steroidal anti-inflammatory drugs (NSAIDs)"
        }
        struct Q4 {
            static let title = "Stiff hands (4)"
            static let question = "A 50-year old woman, who has received a recent diagnosis of rheumatoid arthritis, presents to her GP with ongoing pain and stiffness in her hands and feet. Which joints are usually spared at onset of rheumatoid arthritis?"
            static let answers = ["Proximal interphalangeal joints", "Distal interphalangeal joints", "Metacarpophalangeal joints", "Wrists", "Metatarsophalangeal joints"]
            static let correctAnswer = "Distal interphalangeal joints"
        }

        struct Q5 {
            static let title = "Painful knees (1)"
            static let question = "A 75-year-old woman presents to accident and emergency complaining of pain in her knees. She mentions that this has been troubling her for several months. Pain is generally worse in the evenings and after walking. On examination, there are palpable bony swellings on the distal interphalangeal joints of the fingers on both hands. In addition, there is reduced range of movement and crepitus in the knees. What is the most likely diagnosis?"
            static let answers = ["﻿Rheumatoid arthritis", "Osteoarthritis", "Reactive arthritis", "﻿Polymyalgia rheumatica", "Gout"]
            static let correctAnswer = "Osteoarthritis"
        }
    }
    
    
    
}
