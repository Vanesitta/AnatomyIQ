-- 1. Insert Body Systems
INSERT INTO body_systems (id, name, description) VALUES
(1, 'Cardiovascular System', 'The circulatory system consists of the heart, blood vessels, and blood. Its primary role is to transport oxygen, nutrients, hormones, and waste products throughout the human body.'),
(2, 'Nervous System', 'The nervous system is the body''s control and communication network. It is composed of the brain, spinal cord, sensory organs, and nerves that connect these organs to the rest of the body.'),
(3, 'Skeletal System', 'The skeletal system is the internal framework of the human body. It is composed of bones, cartilages, ligaments, and tissues that connect them.'),
(4, 'Muscular System', 'The muscular system consists of skeletal, smooth, and cardiac muscles. It permits movement of the body, maintains posture, and circulates blood.'),
(5, 'Respiratory System', 'The respiratory system is a biological system consisting of specific organs and structures used for gas exchange in animals and plants.'),
(6, 'Digestive System', 'The digestive system consists of the gastrointestinal tract plus the accessory organs of digestion. Digestion involves the breakdown of food into smaller components.'),
(7, 'Urinary System', 'The urinary system consists of the kidneys, ureters, bladder, and urethra. Its main purpose is to eliminate metabolic waste, regulate blood volume and pressure, and control electrolyte and acid-base balance.'),
(8, 'Endocrine System', 'The endocrine system is a messenger system comprising feedback loops of hormones released by internal glands directly into the circulatory system, regulating metabolism, growth, and tissue function.'),
(9, 'Integumentary System', 'The integumentary system comprises the skin and its appendages (hair, nails, and exocrine glands). It acts as a physical barrier protecting the body from external damage, pathogens, and fluid loss.'),
(10, 'Lymphatic System', 'The lymphatic system is part of the immune and circulatory systems. It consists of a complex network of vessels, tissues, and organs that drain lymph, filter pathogens, and mount immune defenses.'),
(11, 'Reproductive System', 'The reproductive system is a system of sex organs within an organism which work together for the purpose of sexual reproduction, gamete production, and hormonal regulation.')
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;

-- 2. Insert Organs with Study Notes
INSERT INTO organs (id, system_id, name, description, functions, image_url, study_notes) VALUES
(1, 1, 'Heart', 'A muscular organ located in the chest that serves as the central pump of the cardiovascular system.', 'Pumps oxygen-rich blood to body tissues;Receives oxygen-poor blood and routes it to the lungs;Maintains blood pressure and controls heart rate.', '/images/heart.jpg', '### Anatomy of the Heart
The human heart is a hollow, muscular organ located in the thoracic cavity between the lungs. It is enclosed by a double-walled protective sac called the pericardium. The heart consists of four chambers: the right and left atria (which function as receiving chambers) and the right and left ventricles (which function as pumping chambers). The left ventricle is the thickest and most muscular chamber because it must generate enough pressure to pump oxygenated blood into the aorta for systemic circulation to the entire body.

### Physiology & Blood Flow
Blood flows in a strict, one-way loop governed by heart valves:
1. Oxygen-poor blood returns to the right atrium via the superior and inferior vena cava.
2. It passes through the tricuspid valve into the right ventricle, which pumps it to the lungs via the pulmonary artery for oxygenation.
3. Oxygen-rich blood returns to the left atrium through the pulmonary veins and flows into the left ventricle.
4. The left ventricle forces blood out to the body through the largest artery, the aorta.

### Functions & Regulation
The primary function is to pump blood continuously. The cardiac cycle consists of systole (contraction/pumping) and diastole (relaxation/filling). A normal resting heart rate for healthy adults is typically between 60 and 100 beats per minute. Blood pressure is recorded as systolic over diastolic (normal average is 120/80 mmHg).'),
(2, 1, 'Blood Vessels', 'A network of hollow tubes (arteries, capillaries, and veins) that transport blood throughout the entire body.', 'Arteries carry oxygenated blood away from the heart;Capillaries facilitate nutrient and gas exchange at cellular levels;Veins return oxygen-depleted blood back to the heart.', '/images/blood-vessels.jpg', '### Anatomy of Blood Vessels
The cardiovascular system includes three main types of blood vessels: arteries, capillaries, and veins.
- **Arteries**: Have thick, muscular, and elastic walls to withstand high pressure as blood leaves the heart.
- **Capillaries**: Microscopic vessels with walls only one cell layer thick (the tunica intima) to allow fast nutrient and gas exchange.
- **Veins**: Have thinner walls, larger lumens, and contain internal one-way valves to prevent the backflow of blood under low pressure.

### Physiology of Circulation
Arteries carry blood away from the heart. The largest artery is the aorta. Capillaries connect arterioles to venules, forming dense networks where oxygen, carbon dioxide, glucose, and wastes are exchanged with surrounding tissues. Veins carry deoxygenated blood toward the heart. The superior vena cava collects blood from the upper body, and the inferior vena cava collects blood from the lower body.

### Functions & Hemodynamics
Blood vessels regulate blood pressure and flow.
- **Vasoconstriction**: Narrowing of the blood vessel lumen to increase blood pressure.
- **Vasodilation**: Widening of the lumen to decrease blood pressure and increase local blood flow.
- **Venous Return**: Because venous pressure is very low, skeletal muscle contractions (skeletal muscle pump) squeeze blood in veins back toward the heart, aided by valves that keep the flow unidirectional.'),
(3, 2, 'Brain', 'The command center of the human body, responsible for processing information, controlling movements, and hosting thoughts and emotions.', 'Coordinates sensory reception and perceptual processing;Controls conscious and unconscious motor activities;Enables high-level cognition, learning, memory, and emotional processing.', '/images/brain.png', '### Anatomy of the Brain
The brain is the main organ of the central nervous system, protected by the skull and three protective membrane layers called meninges (dura mater, arachnoid mater, and pia mater). The brain is bathed and cushioned by cerebrospinal fluid (CSF). It has three major subdivisions: the cerebrum (divided into two hemispheres), the cerebellum (located at the back), and the brainstem (connecting to the spinal cord). The outer surface is the cerebral cortex, composed of gray matter.

### Physiology & Lobes
The cerebral cortex is divided into four functional lobes:
- **Frontal Lobe**: Handles high-level cognitive tasks, reasoning, decision-making, speech, and voluntary motor control.
- **Parietal Lobe**: Processes sensory information like touch, pressure, and temperature.
- **Occipital Lobe**: Primarily responsible for processing visual information.
- **Temporal Lobe**: Associated with hearing, language comprehension, and memory.
- **Deep Structures**: The thalamus acts as a sensory relay station routing signals to the cortex. The hypothalamus regulates homeostasis, body temperature, and hunger.

### Function & Brainstem
The cerebellum coordinates voluntary movement, balance, and posture. The brainstem (comprising the midbrain, pons, and medulla oblongata) controls essential involuntary life functions such as breathing, heart rate, and blood pressure.'),
(4, 2, 'Spinal Cord', 'A long, thin, tubular bundle of nervous tissue and support cells that extends from the brainstem down through the vertebral column.', 'Transmits nerve signals between the brain and the rest of the body;Coordinates spinal reflexes (involuntary, rapid actions);Acts as a pathway for motor and sensory impulses.', '/images/spinal-cord.jpg', '### Anatomy of the Spinal Cord
The spinal cord is a cylinder-shaped bundle of nervous tissue extending from the medulla oblongata of the brainstem down through the vertebral column (spine). It is protected by bones called vertebrae, the meninges, and cerebrospinal fluid (CSF). In cross-section, the spinal cord exhibits an outer region of white matter (containing myelinated nerve tracts/axons) and an inner butterfly-shaped region of gray matter (containing neuronal cell bodies and synapses).

### Spinal Nerves & Roots
There are 31 pairs of spinal nerves branching off along the cord to connect with the body. Each spinal nerve attaches via two roots:
- **Dorsal Root**: Carries incoming sensory signals. It contains the dorsal root ganglion which houses the cell bodies of sensory neurons.
- **Ventral Root**: Carries outgoing motor commands to muscles and glands.

### Function & Reflexes
The spinal cord acts as a two-way transmission highway for sensory signals traveling up to the brain and motor commands traveling down to the body. It also serves as a reflex center. Spinal reflexes are rapid, involuntary motor responses (e.g. pulling your hand away from a hot surface) processed directly by a reflex arc in the spinal cord without brain involvement.'),
(5, 3, 'Skull', 'The bony structure that forms the head in vertebrates, protecting the brain and supporting the structures of the face.', 'Protects the brain from mechanical trauma;Houses primary sensory organs (eyes, ears, nose);Provides structural attachment for facial and chewing muscles.', '/images/skull.jpg', '### Anatomy of the Skull
The skull is a highly specialized bony structure consisting of 22 individual bones. It is divided into two primary parts:
- **Cranium (8 bones)**: Forms the cranial cavity that encloses and protects the brain. Key bones include the frontal, parietal, occipital, and temporal bones.
- **Facial Skeleton (14 bones)**: Form the structural framework of the face, supporting sensory pathways and the jaw.
Skull bones are firmly held together by immovable joints called sutures, with the mandible (lower jaw) being the only exception.

### Physiology & Senses
The skull acts as a protective shield for the central nervous system''s primary processing center. It contains cavities (orbits, nasal cavity, middle/inner ear cavities) that house the sensory organs for vision, smell, hearing, and equilibrium.

### Function & Mastication
Beyond protection, the skull provides anchor points for skeletal muscles:
- **Facial Expression Muscles**: Attach directly to facial bones to allow non-verbal communication.
- **Mastication Muscles**: The temporalis and masseter muscles attach to the mandible, providing the high-force movements required for chewing (mastication).'),
(6, 3, 'Spine', 'The central support column of the skeleton, consisting of a chain of vertebrae protecting the spinal cord.', 'Protects the spinal cord within the vertebral canal;Supports the weight of the head, neck, and trunk;Allows flexible trunk movements including bending and twisting.', '/images/spine.jpg', '### Anatomy of the Spine
The spine (vertebral column) initially consists of 33 vertebrae, which are categorized into five distinct regional groups:
- **Cervical (7 vertebrae)**: Located in the neck, facilitating head rotation and tilting.
- **Thoracic (12 vertebrae)**: Located in the upper back, articulating posteriorly with the ribs.
- **Lumbar (5 vertebrae)**: Located in the lower back, consisting of the largest vertebrae to bear weight.
- **Sacrum (5 fused vertebrae)**: Integrates into the pelvic girdle to transfer weight to the lower limbs.
- **Coccyx (4 fused vertebrae)**: The tailbone, serving as an attachment point for pelvic floor ligaments.
Intervertebral discs of fibrocartilage sit between adjacent vertebrae to act as shock absorbers.

### Physiology & Movement
The spine provides a flexible support column. Natural curves (cervical, thoracic, lumbar, sacral) act like springs, distributing load and facilitating balance. Joints between vertebrae allow slight sliding movements that collectively enable extension, flexion, and rotation of the torso.

### Spinal Protection
The primary physiological role is structural safety: the vertebral foramina of the stacked vertebrae line up to form the vertebral canal, a secure bony tunnel housing and protecting the spinal cord.'),
(7, 3, 'Ribcage', 'A protective basket-like bony structure formed by the ribs, sternum, and thoracic vertebrae.', 'Protects vital thoracic organs (heart and lungs);Assists in the mechanical process of respiration;Supports the shoulder girdle and upper limbs.', '/images/ribcage.jpg', '### Anatomy of the Ribcage
The ribcage consists of the sternum (breastbone) anteriorly, 12 thoracic vertebrae posteriorly, and 12 pairs of ribs. The ribs are classified based on their anterior attachments:
- **True Ribs (Pairs 1-7)**: Connect directly to the sternum via individual strips of costal cartilage.
- **False Ribs (Pairs 8-10)**: Connect indirectly to the sternum by attaching to the costal cartilage of rib 7.
- **Floating Ribs (Pairs 11-12)**: Have no anterior connection, ending freely in the abdominal wall muscles.

### Respiration Mechanics
The ribcage is dynamic. Costal cartilages provide elasticity, allowing the ribs to pivot. During inhalation, the ribs lift upward and outward, expanding the thoracic cavity. This mechanical expansion drops intrapleural pressure, allowing the lungs to fill with air.

### Organ Protection
The primary function is to shield the heart, lungs, and major blood vessels (aorta, vena cava) from external trauma, acting as a lightweight but strong protective cage.'),
(8, 3, 'Femur', 'The longest, heaviest, and strongest bone in the human body, forming the skeletal structure of the thigh.', 'Supports the entire weight of the upper body during standing and locomotion;Acts as a powerful lever for skeletal muscles to walk, run, and jump;Hosts red bone marrow for the production of red blood cells.', '/images/femur.jpg', '### Anatomy of the Femur
The femur (thigh bone) is the longest and strongest bone in the human skeletal system. It features:
- **Proximal End**: A rounded head that fits into the pelvic acetabulum (forming the hip joint) and a narrow neck.
- **Shaft**: A long, cylindrical body that contains the medullary cavity.
- **Distal End**: Large lateral and medial condyles that articulate with the tibia and patella to form the knee joint.

### Physiology & Locomotion
As a long bone, the femur acts as a rigid lever. Large, powerful muscles (such as the quadriceps and hamstrings) attach to femur landmarks (like the trochanters and linea aspera). When these muscles contract, they pivot the femur at the hip and knee joints, enabling walking, running, and jumping.

### Hematopoiesis Site
Inside the proximal epiphysis of the femur is trabecular (spongy) bone containing red bone marrow. This marrow is a major site of hematopoiesis—the process by which new red blood cells, white blood cells, and platelets are continuously synthesized.'),
(9, 4, 'Biceps', 'A prominent two-headed muscle located on the anterior compartment of the upper arm.', 'Flexes the elbow joint, bringing the forearm closer to the humerus;Supinates the forearm, rotating the palm upward;Assists in weak shoulder flexion.', '/images/biceps.jpg', '### Anatomy of the Biceps
The biceps brachii is a two-headed muscle situated on the anterior upper arm.
- **Short Head Origin**: Originates from the coracoid process of the scapula.
- **Long Head Origin**: Originates from the supraglenoid tubercle of the scapula, passing through the intertubercular groove.
- **Insertion**: Both heads merge into a single tendon that inserts into the radial tuberosity of the radius bone in the forearm.

### Physiology & Contraction
The biceps is controlled by the musculocutaneous nerve. Skeletal muscle contraction occurs via the sliding of actin and myosin protein filaments. Upon stimulation, the muscle shortens and pulls on the radius bone. Because it crosses both the shoulder and elbow joints, it can affect movement at both.

### Elbow Flexion & Supination
The biceps has two primary actions:
- **Elbow Flexion**: It acts as the agonist (prime mover) to bend the elbow, especially when the forearm is supinated.
- **Forearm Supination**: It rotates the radius, turning the palm upward (e.g. the motion of turning a screwdriver).'),
(10, 4, 'Quadriceps', 'A large, powerful muscle group consisting of four distinct muscles on the front of the thigh.', 'Extends the knee joint, straightening the lower leg;Rectus femoris assists in flexing the hip joint;Stabilizes the patella and knee joint during weight-bearing activities.', '/images/quadriceps.jpg', '### Anatomy of the Quadriceps
The quadriceps femoris is a massive muscle group on the anterior thigh, composed of four distinct muscles:
1. **Rectus Femoris**: Lies in the middle, originating from the ilium of the pelvis (crossing both hip and knee joints).
2. **Vastus Lateralis**: Positioned on the outer side of the thigh.
3. **Vastus Medialis**: Positioned on the inner side of the thigh.
4. **Vastus Intermedius**: Lies deep to the rectus femoris, directly on the femur shaft.
All four muscles merge into the thick quadriceps tendon, which encloses the patella (kneecap) and continues as the patellar ligament to insert onto the tibial tuberosity of the tibia.

### Physiology & Extension
The quadriceps is innervated by the femoral nerve. When the muscle group contracts, it exerts a pull on the patellar ligament, rotating the tibia forward. This extends (straightens) the leg at the knee joint. This action is critical for resisting gravity during walking, running, climbing stairs, and jumping.

### Patellar Stabilization
The patella acts as a anatomical pulley, increasing the mechanical advantage of the quadriceps. The vastus medialis and vastus lateralis exert opposing lateral forces, keeping the patella tracking smoothly in the femoral groove.'),
(11, 4, 'Skeletal Muscle', 'A general overview of skeletal muscle tissue, which connects to the skeleton to enable voluntary movement.', 'Translates neural commands into physical force and skeletal movement;Maintains posture and joint stability against gravity;Generates body heat as a byproduct of metabolic activity (thermogenesis).', '/images/skeletal-muscle.jpg', '### Anatomy of Skeletal Muscle
Skeletal muscle tissue is composed of long, cylindrical, multinucleated cells called muscle fibers. The muscle has a highly structured hierarchy wrapped in connective tissue:
- **Epimysium**: Dense collagen layer surrounding the entire muscle.
- **Perimysium**: Wraps bundles of muscle fibers called fascicles.
- **Endomysium**: Delicate sheath wrapping each individual muscle fiber.
Inside each fiber are myofibrils, which consist of repeating functional contractile units called **sarcomeres**. Sarcomeres contain thick filaments (myosin) and thin filaments (actin).

### Physiology of Contraction
Skeletal muscle is voluntary, stimulated by somatic motor neurons.
1. An action potential reaches the neuromuscular junction, triggering the release of the neurotransmitter **acetylcholine (ACh)**.
2. ACh binds to receptors, generating a muscle action potential that travels down T-tubules.
3. This triggers the release of **calcium ions** from the sarcoplasmic reticulum.
4. Calcium binds to troponin, exposing binding sites on actin.
5. Myosin heads bind to actin, performing a power stroke powered by ATP (Sliding Filament Theory), shortening the sarcomere.

### Functions & Heat Generation
Skeletal muscles pull on bones via tendons to create motion. They also contract continuously to maintain posture. During contraction, ATP hydrolysis releases thermal energy, generating body heat (thermogenesis) to maintain homeostasis.'),
(12, 5, 'Lungs', 'The primary organs of the respiratory system, responsible for gas exchange between blood and air.', 'Extracts oxygen from inhaled air and transfers it into the bloodstream;Excretes carbon dioxide waste from the blood into exhaled air;Helps regulate blood pH levels via carbon dioxide excretion.', '/images/lungs.jpg', '### Anatomy of the Lungs
The lungs are a pair of spongy, air-filled organs located in the thoracic cavity.
- **Right Lung**: Divided into three lobes (superior, middle, inferior) by oblique and horizontal fissures.
- **Left Lung**: Divided into two lobes (superior, inferior) by an oblique fissure, featuring a cardiac notch to accommodate the heart.
The lungs are enclosed in the pleural cavity by the double-layered pleura (visceral pleura covering lung tissue, and parietal pleura lining the thoracic wall). Inside, the airways branch into bronchi, bronchioles, and terminate in millions of microscopic air sacs called **alveoli**.

### Gas Exchange Physiology
Gas exchange occurs across the respiratory membrane (composed of the alveolar wall and pulmonary capillary endothelium):
- **Oxygen Diffusion**: Inhaled air in the alveoli has a high partial pressure of oxygen. Oxygen diffuses across the thin membrane into the capillary blood, binding to hemoglobin.
- **Carbon Dioxide Diffusion**: Deoxygenated blood has a high partial pressure of CO2. Carbon dioxide diffuses out of the blood into the alveoli to be exhaled.

### Alveolar Surface Tension
Type II alveolar cells secrete **surfactant**, a phospholipid fluid that reduces surface tension inside the alveoli. This prevents the microscopic air sacs from collapsing during exhalation, lowering the muscular effort required to inflate the lungs.'),
(13, 5, 'Trachea', 'A cartilaginous tube that extends from the larynx and conducts air to the primary bronchi.', 'Conducts inhaled air into the bronchial tree and exhaled air out;Traps dust, allergens, and microbes in mucus to protect the lower airways;Cilia sweep trapped debris upward away from the lungs.', '/images/trachea.jpg', '### Anatomy of the Trachea
The trachea (windpipe) is a tubular airway about 12 cm long, running anterior to the esophagus. Its wall is structurally reinforced by 16 to 20 C-shaped rings of **hyaline cartilage**. The posterior open side of the C-ring contains the trachealis muscle. The inner lining is composed of **pseudostratified ciliated columnar epithelium** interspersed with mucus-secreting **goblet cells**. At its base, the trachea features an internal ridge called the **carina** before bifurcating (splitting) into the right and left primary bronchi.

### Cartilage Function
The C-shaped hyaline cartilage rings provide rigid structural support. This prevents the trachea from collapsing inward during the negative pressure of inhalation. The posterior open side allows the adjacent esophagus to expand forward when large boluses of food are swallowed.

### Mucociliary Escalator
The ciliated epithelium acts as a defense mechanism:
1. Goblet cells secrete sticky mucus that traps dust, pollen, and microbes.
2. The cilia beat rhythmically upward, moving the mucus toward the pharynx (mucociliary escalator).
3. Once in the pharynx, the mucus is either swallowed into the stomach (where acid destroys pathogens) or coughed out.'),
(14, 5, 'Diaphragm', 'A dome-shaped skeletal muscle sheet that separates the thoracic and abdominal cavities, serving as the main muscle of breathing.', 'Contracts to expand the thoracic cavity and draw air into the lungs;Relaxes to compress the thoracic cavity and expel air;Separates the heart/lungs from the digestive organs.', '/images/diaphragm.jpg', '### Anatomy of the Diaphragm
The diaphragm is a broad, dome-shaped sheet of skeletal muscle that forms the floor of the thoracic cavity and the roof of the abdominal cavity. It is innervated by the **phrenic nerve**, which originates from cervical spinal segments C3-C5. The muscle fibers of the diaphragm insert into a central, non-contractile tendon.

### Physiology of Breathing
The diaphragm is the primary muscle driver of ventilation:
- **Inhalation (Active)**: The phrenic nerve stimulates the diaphragm to contract. It flattens and moves downward, increasing the vertical dimension of the thoracic cavity. This increase in volume drops the pressure inside the lungs below atmospheric pressure, causing air to rush in.
- **Exhalation (Passive)**: The nerve signals cease, and the diaphragm relaxes, returning to its dome shape and moving upward. Combined with the elastic recoil of the lungs, this decreases thoracic volume, increasing pressure and pushing air out.'),
(15, 6, 'Stomach', 'A J-shaped muscular organ in the upper left abdomen that performs mechanical and early chemical digestion.', 'Churns food mechanically using three smooth muscle layers;Secretes hydrochloric acid and pepsin to break down proteins;Produces intrinsic factor required for vitamin B12 absorption.', '/images/stomach.jpg', '### Anatomy of the Stomach
The stomach is a J-shaped, highly distensible organ divided into four regions:
1. **Cardia**: Small entry zone adjacent to the esophagus.
2. **Fundus**: Dome-shaped upper storage area.
3. **Body**: The main central region.
4. **Pylorus**: The funnel-shaped exit leading to the duodenum.
It features two muscular valves: the lower esophageal (cardiac) sphincter at the entry, and the **pyloric sphincter** at the exit. The inner mucosa is folded into large ridges called **rugae**, which flatten as the stomach fills. The muscularis externa has three layers: circular, longitudinal, and oblique.

### Digestion Physiology
The stomach performs both mechanical and chemical processes:
- **Mechanical Churning**: The three muscle layers contract in varying directions to physically grind food.
- **Chemical Digestion**: Gastric glands contain **parietal cells** (secreting hydrochloric acid to lower pH to 1.5-3.5 and kill bacteria) and **chief cells** (secreting pepsinogen, which is activated by acid into **pepsin** to digest proteins).
- **Chyme Formation**: These processes convert food into an acidic, semi-fluid paste called **chyme**.

### Mucosal Barrier & Intrinsic Factor
To prevent hydrochloric acid and pepsin from digesting the stomach wall, goblet cells secrete a thick layer of alkaline mucus. Additionally, the stomach secretes **intrinsic factor**, a glycoprotein essential for the absorption of vitamin B12 in the small intestine.'),
(16, 6, 'Small Intestine', 'A long, narrow tube where the majority of chemical digestion and nutrient absorption takes place.', 'Completes chemical digestion of proteins, fats, and carbohydrates;Absorbs nutrients, water, and minerals across its highly folded lining;Moves food residue forward via peristalsis.', '/images/small-intestine.jpg', '### Anatomy of the Small Intestine
The small intestine is a highly folded tube about 6 meters long, divided into three consecutive regions:
1. **Duodenum (25 cm)**: The C-shaped initial segment that receives acidic chyme from the stomach, bile from the liver/gallbladder, and digestive enzymes from the pancreas.
2. **Jejunum (2.5 m)**: The middle portion where the bulk of nutrient absorption occurs.
3. **Ileum (3.6 m)**: The final segment that connects to the large intestine at the **ileocecal valve**.
Its inner surface is highly folded into circular folds, **villi** (finger-like projections), and **microvilli** (microscopic projections on cells forming the brush border) to maximize surface area.

### Chemical Digestion
Digestion is completed in the duodenum by:
- **Bile**: Emulsifies large fat droplets.
- **Pancreatic Enzymes**: Amylase (carbohydrates), trypsin/chymotrypsin (proteins), and lipase (fats).
- **Brush Border Enzymes**: Integral membrane proteins on microvilli that break down sugars and peptides.

### Absorption Mechanics
Water-soluble nutrients (amino acids, monosaccharides) are absorbed across the epithelial cells into blood capillaries. Lipid digestion products (fatty acids, monoglycerides) are packed into chylomicrons and absorbed into specialized lymphatic vessels called **lacteals** inside the villi.'),
(17, 6, 'Large Intestine', 'The final section of the digestive tract, consisting of the cecum, colon, rectum, and anal canal.', 'Absorbs remaining water and mineral salts, condensing waste;Hosts gut microbiota that synthesize vitamins K and B;Stores and eliminates solid waste (feces).', '/images/large-intestine.jpg', '### Anatomy of the Large Intestine
The large intestine is wider but shorter than the small intestine, measuring about 1.5 meters. It consists of:
- **Cecum**: A blind-ended pouch at the entry, to which the vestigial **appendix** is attached.
- **Colon**: Divided into ascending, transverse, descending, and sigmoid colon segments.
- **Rectum**: A straight muscular tube that stores feces.
- **Anal Canal**: The final exit pathway governed by internal and external sphincters.
The outer wall has three longitudinal bands of smooth muscle called **teniae coli** that pull the colon into pocket-like sacs called **haustra**.

### Water Absorption & Feces
By the time food residue reaches the large intestine, nutrient absorption is complete. The colon absorbs remaining water and electrolytes (such as sodium and chloride), converting watery chyme into compacted solid waste called **feces**.

### Gut Microbiota & Elimination
The large intestine houses trillions of symbiotic bacteria (gut microbiota) that digest remaining fiber and synthesize essential vitamins, particularly **vitamin K** and certain **B vitamins**. Feces are moved toward the rectum via slow peristalsis and powerful **mass movements** (strong waves occurring 3-4 times a day, usually after meals), triggering the defecation reflex.'),
(18, 6, 'Liver', 'The largest internal organ, responsible for bile production, metabolism, and blood filtration.', 'Produces bile to assist in the mechanical digestion of fats;Detoxifies drugs, alcohol, and metabolic waste from the blood;Stores excess glucose as glycogen and synthesizes plasma proteins.', '/images/liver.jpg', '### Anatomy of the Liver
The liver is the largest internal organ, located in the upper right quadrant of the abdominal cavity. It is divided into four structural lobes: the large right and left lobes, and the smaller caudate and quadrate lobes. It is composed of hexagonal functional units called **lobules**. At the corners of each lobule is a **portal triad** consisting of a branch of the bile duct, a branch of the hepatic artery (supplying oxygen), and a branch of the hepatic portal vein (bringing nutrient-rich blood from the digestive tract). In the center of each lobule is a central vein.

### Bile Production
The liver''s primary digestive role is the synthesis of **bile**, a yellow-green fluid containing bile salts. Bile is stored and concentrated in the gallbladder before being secreted into the duodenum. Bile salts act like biological detergents, emulsifying large lipid droplets into tiny micelles, which increases the surface area for pancreatic lipase enzymes to digest fats.

### Metabolic & Detoxification Functions
The liver receives all blood draining from the stomach and intestines via the hepatic portal vein. Its hepatocytes perform crucial tasks:
- **Glucose Buffering**: Stores excess glucose as **glycogen** (glycogenesis) and releases glucose back into the blood when levels drop (glycogenolysis).
- **Plasma Protein Synthesis**: Synthesizes crucial proteins including **albumin** (maintains blood osmotic pressure) and fibrinogen/prothrombin (clotting factors).
- **Detoxification**: Converts toxic ammonia (a byproduct of protein metabolism) into urea, and metabolizes drugs, hormones, and alcohol into harmless excretable compounds.'),
(19, 7, 'Kidneys', 'Bean-shaped organs located in the retroperitoneum responsible for blood filtration, urine production, and fluid/electrolyte homeostasis.', 'Filters metabolic waste and toxins from blood;Regulates blood volume and systemic blood pressure via renin;Maintains electrolyte and acid-base homeostasis.', '/images/kidneys.jpg', '### Anatomy of the Kidneys
The kidneys are paired, bean-shaped organs positioned retroperitoneally on either side of the spine. Each kidney consists of an outer renal cortex, an inner renal medulla containing renal pyramids, and a central renal pelvis that collects urine. The functional microscopic unit is the **nephron**, with each kidney housing approximately 1 million nephrons.

### Physiology & Filtration
Urine formation occurs in three distinct phases:
1. **Glomerular Filtration**: Blood pressure forces water and small solutes across the fenestrated glomerular capillaries into Bowman''s capsule.
2. **Tubular Reabsorption**: Vital nutrients, water, and ions (glucose, amino acids, Na+, HCO3-) are reabsorbed back into peritubular capillaries along the proximal tubule and loop of Henle.
3. **Tubular Secretion**: Excess H+, K+, and drugs are actively secreted into the distal tubule for excretion.

### Endocrine & Homeostatic Functions
The kidneys perform key regulatory tasks:
- **Erythropoietin (EPO)**: Secreted in response to hypoxia to stimulate red blood cell production in bone marrow.
- **Renin-Angiotensin System**: Secretes renin when blood pressure drops, initiating vasoconstriction and aldosterone release to restore pressure.
- **Calcitriol**: Converts vitamin D into its active hormone form to increase intestinal calcium absorption.'),
(20, 7, 'Bladder', 'A hollow, muscular sac in the pelvis that stores urine before micturition.', 'Stores urine at low intravesical pressure;Expels urine through synchronized contraction of the detrusor muscle;Maintains urinary continence via internal and external sphincters.', '/images/bladder.jpg', '### Anatomy of the Bladder
The urinary bladder is a distensible muscular sac located in the anterior pelvic cavity. Its mucosa is lined by **transitional epithelium** (urothelium) and folded into rugae, allowing it to stretch dramatically as it fills. The wall consists of three layers of smooth muscle collectively called the **detrusor muscle**. The triangular region at the base defined by the two ureteral orifices and the urethral exit is the **trigone**, which remains smooth during expansion.

### Physiology of Storage & Micturition
- **Storage Phase**: Sympathetic nerve stimulation relaxes the detrusor muscle and contracts the internal urethral sphincter, allowing the bladder to expand comfortably to 400-600 mL.
- **Micturition Reflex**: When stretch receptors in the bladder wall are stimulated, sensory signals travel to the sacral spinal cord. Parasympathetic nerve stimulation triggers detrusor muscle contraction and internal sphincter relaxation, while voluntary somatic relaxation of the external sphincter allows urine flow.'),
(21, 7, 'Ureters', 'Paired muscular tubes that propel urine from the renal pelvis of each kidney to the urinary bladder.', 'Transmits urine continuously from kidneys to bladder;Generates peristaltic waves to push urine against pressure;Prevents urine backflow into kidneys via one-way entry valves.', '/images/ureters.jpg', '### Anatomy of the Ureters
The ureters are two muscular tubes approximately 25-30 cm long that connect the renal pelvis of each kidney to the base of the urinary bladder. The wall is composed of three distinct layers:
- **Mucosa**: Lined with transitional epithelium to protect against acidic urine.
- **Muscularis**: Composed of inner longitudinal and outer circular smooth muscle layers.
- **Adventitia**: Connective tissue layer anchoring the ureters to surrounding structures.

### Peristaltic Transport
Urine transport is active rather than gravitational:
- Pacemaker cells in the renal pelvis generate rhythmic electrical impulses.
- Smooth muscle in the ureter contracts sequentially, producing wave-like **peristaltic contractions** every 10-30 seconds to push urine forward.

### Ureterovesical Junction
The ureters enter the posterior bladder wall at an oblique angle. As the bladder fills with urine, intravesical pressure increases, compressing the distal ends of the ureters. This physiological valve prevents vesicoureteral reflux (backflow of urine to the kidneys).'),
(22, 8, 'Pituitary Gland', 'A small pea-sized endocrine gland located at the base of the brain, known as the master endocrine gland.', 'Regulates metabolism, growth, and stress responses;Controls secondary endocrine glands (thyroid, adrenals, gonads);Stores and releases hypothalamic hormones (ADH and oxytocin).', '/images/pituitary-gland.jpg', '### Anatomy of the Pituitary Gland
The pituitary gland (hypophysis) rests in the sella turcica of the sphenoid bone and is attached to the hypothalamus by the infundibulum stalk. It consists of two distinct structural lobes:
- **Anterior Pituitary (Adenohypophysis)**: Glandular tissue originating from oral ectoderm.
- **Posterior Pituitary (Neurohypophysis)**: Neural tissue consisting of axon terminals extending directly from hypothalamic neurons.

### Anterior Pituitary Hormones
The anterior lobe synthesizes and secretes six major hormones under the control of hypothalamic releasing/inhibiting hormones:
- **Growth Hormone (GH)**: Stimulates tissue growth and protein synthesis.
- **Thyroid-Stimulating Hormone (TSH)**: Stimulates thyroid hormone production.
- **Adrenocorticotropic Hormone (ACTH)**: Triggers cortisol secretion from adrenal cortex.
- **FSH & LH**: Regulate gonad function and sex hormone production.
- **Prolactin**: Stimulates milk production in mammary glands.

### Posterior Pituitary Secretions
The posterior lobe stores and releases two hormones synthesized in the hypothalamus:
- **Antidiuretic Hormone (ADH/Vasopressin)**: Promotes renal water reabsorption to increase blood volume.
- **Oxytocin**: Triggers uterine contractions during labor and milk ejection during lactation.'),
(23, 8, 'Thyroid', 'A butterfly-shaped endocrine gland in the anterior neck responsible for regulating basal metabolic rate.', 'Regulates basal metabolic rate and body heat production;Synthesizes T3 and T4 hormones from iodine and tyrosine;Produces calcitonin to lower elevated blood calcium levels.', '/images/thyroid.jpg', '### Anatomy of the Thyroid Gland
The thyroid gland is located in the anterior neck inferior to the larynx, consisting of left and right lobes connected by a central median isthmus. Histologically, it is composed of thousands of spherical **thyroid follicles**. The walls of these follicles are formed by simple cuboidal follicular cells enclosing a central proteinaceous fluid called **colloid**.

### Thyroid Hormone Synthesis & Physiology
Follicular cells trap iodide ions from blood and synthesize **thyroglobulin**:
- Iodide is oxidized and attached to tyrosine residues, yielding **Thyroxine (T4)** and **Triiodothyronine (T3)**.
- T3 and T4 are released into circulation bound to thyroid-binding globulin.
- **Cellular Effect**: T3 increases gene expression for metabolic enzymes, boosting basal metabolic rate (BMR), oxygen consumption, ATP production, and body heat generation (calorigenic effect).

### Calcitonin Secretion
Interspersed between follicles are parafollicular cells (**C-cells**). When blood calcium levels rise above normal, C-cells secrete **calcitonin**, which inhibits osteoclast bone resorption and promotes renal calcium excretion, lowering blood calcium.'),
(24, 8, 'Adrenal Glands', 'Paired crescent-shaped endocrine glands sitting atop each kidney, regulating stress responses and electrolyte balance.', 'Secretes steroid hormones regulating salt, glucose, and sex hormones;Produces epinephrine and norepinephrine for emergency stress responses;Maintains blood pressure and electrolyte balance via aldosterone.', '/images/adrenal-gland.jpg', '### Anatomy of the Adrenal Glands
The adrenal (suprarenal) glands are paired endocrine organs situated atop the superior pole of each kidney. Each gland consists of two functionally distinct regions:
- **Adrenal Cortex**: Outer steroid-producing region divided into three concentric zones.
- **Adrenal Medulla**: Inner neuroendocrine core derived from neural crest cells.

### Adrenal Cortex Hormones
- **Zona Glomerulosa (Outer)**: Produces **Aldosterone** (mineralocorticoid), which stimulates renal sodium reabsorption and potassium excretion to regulate blood pressure.
- **Zona Fasciculata (Middle)**: Produces **Cortisol** (glucocorticoid) in response to ACTH. Cortisol promotes gluconeogenesis, breakdown of fats/proteins, and suppresses inflammation during stress.
- **Zona Reticularis (Inner)**: Secretes weak adrenal androgens (DHEA).

### Adrenal Medulla & Sympathetic Nervous System
The medulla contains **chromaffin cells** innervated by preganglionic sympathetic fibers. Upon stimulation during acute stress (fight-or-flight), chromaffin cells secrete **Epinephrine (80%)** and **Norepinephrine (20%)**, causing rapid tachycardia, bronchodilation, and glucose mobilization.'),
(25, 9, 'Skin', 'The body''s largest organ, forming a protective barrier against environmental damage, pathogens, and desiccation.', 'Protects underlying tissues from physical trauma, pathogens, and UV radiation;Regulates body temperature via thermoregulatory sweating and cutaneous blood flow;Synthesizes Vitamin D3 upon solar ultraviolet irradiation.', '/images/skin.jpg', '### Anatomy of the Skin
The skin (cutaneous membrane) covers the external surface of the body and consists of two primary layers resting on a subcutaneous layer:
1. **Epidermis**: A stratified squamous keratinized epithelium featuring 5 layers (stratum basale, spinosum, granulosum, lucidum, corneum).
2. **Dermis**: Dense irregular connective tissue layer divided into papillary and reticular regions, housing blood vessels, nerve endings, and hair follicles.
3. **Hypodermis (Subcutis)**: Areolar and adipose tissue anchoring skin to underlying fascia.

### Specialized Epidermal Cells
- **Keratinocytes (90%)**: Produce fibrous keratin for structural toughness and water impermeability.
- **Melanocytes**: Produce melanin pigment to absorb harmful UV radiation.
- **Langerhans Cells**: Antigen-presenting dendritic cells initiating immune responses.
- **Merkel Cells**: Touch receptors communicating with sensory nerve endings.

### Thermoregulation & Vitamin D Synthesis
- **Temperature Control**: When overheated, dermal capillaries dilate (cutaneous vasodilation) and eccrine sweat glands secrete sweat for evaporative cooling. In cold conditions, vasodilation ceases and arrector pili contract.
- **Vitamin D3**: Dehydrocholesterol in basal keratinocytes is converted by UVB radiation into cholecalciferol, which is later activated by the liver and kidneys.'),
(26, 9, 'Hair', 'Keratinized structures originating from follicles in the dermis covering most cutaneous surfaces.', 'Provides thermal insulation and UV protection for the scalp;Acts as a sensitive sensory receptor detecting light touch and movement;Shields eyes, ears, and nostrils from foreign airborne debris.', '/images/hair.jpg', '### Anatomy of Hair & Follicle
Hair consists of flexible strands of dead, highly keratinized epithelial cells. Each hair originates from a **hair follicle** dipping into the dermis:
- **Hair Bulb**: The expanded base containing actively dividing matrix cells and the hair papilla (blood supply).
- **Hair Root**: The portion anchored within the follicle below the skin surface.
- **Hair Shaft**: The visible portion extending above the epidermis, composed of an inner medulla, middle cortex (pigment), and outer cuticle.

### Hair Growth Cycle
Hair growth occurs in three repeating cyclical phases:
1. **Anagen (Growth Phase)**: Matrix cells divide rapidly, pushing the shaft upward (lasts 2-7 years for scalp hair).
2. **Catagen (Regression Phase)**: Follicle shrinks and detaches from papilla (2-3 weeks).
3. **Telogen (Resting Phase)**: Hair falls out or is pushed out by a new growing shaft (1-4 months).

### Sensory & Motor Features
Every hair follicle is wrapped in a **hair follicle receptor** (root hair plexus) that detects minute deflection of the shaft. Attached to the side of the follicle is the **arrector pili muscle**, a smooth muscle bundle that contracts under sympathetic nerve control to pull hair upright (goosebumps) and trap insulating air.'),
(27, 9, 'Nails', 'Hard plates of densely packed keratin located on the dorsal surfaces of fingertips and toes.', 'Protects delicate distal phalanges from mechanical trauma;Enhances precise tactile sensation and fine motor manipulation;Provides rigid counterforce against the digital pulp during gripping.', '/images/nail.jpg', '### Anatomy of the Nail
Nails are modified, heavily cornified epidermal structures present on the dorsal tips of fingers and toes. Key anatomical parts include:
- **Nail Plate**: The hard, visible outer body composed of flattened, tightly packed dead keratinized cells.
- **Nail Bed**: The layer of vascular epidermal tissue beneath the nail plate.
- **Nail Matrix**: The thickened proximal portion of the nail bed containing proliferating stem cells that produce the nail plate.
- **Lunula**: The pale, crescent-shaped area at the base of the nail overlying the matrix.
- **Eponychium (Cuticle)**: The stratum corneum fold over the proximal nail border.

### Growth & Physiology
Nail growth occurs continuously throughout life:
- Stem cells in the nail matrix divide rapidly and undergo intense keratinization.
- As new cells accumulate, they flatten and push the older nail plate distally over the nail bed.
- Average fingernail growth is approximately 3 mm per month.

### Mechanical Functions
Nails act as protective shields for the delicate sensory tips of digits. Additionally, they provide a rigid backing that squeezes digital pulp during touch, enhancing tactile sensitivity and enabling precise fine-motor manipulation of small objects.'),
(28, 10, 'Spleen', 'The largest lymphatic organ, located in the upper left abdomen, responsible for blood filtration and immune surveillance.', 'Filters worn-out and damaged erythrocytes from blood circulation;Mounts humoral and cell-mediated immune responses against blood-borne antigens;Stores platelets and blood cells for rapid release during hemorrhage.', '/images/spleen.jpg', '### Anatomy of the Spleen
The spleen is a purplish, highly vascular organ situated in the left hypochondriac region of the abdomen, lateral to the stomach. It is wrapped in a fibrous capsule that extends inward as trabeculae. Histologically, the splenic parenchyma is divided into two distinct functional regions:
- **Red Pulp (75%)**: Consists of splenic cords of Billroth and large venous sinusoids packed with erythrocytes and macrophages.
- **White Pulp (25%)**: Consists of lymphoid tissue forming periarteriolar lymphoid sheaths (PALS) rich in T-cells, and lymphatic follicles rich in B-cells.

### Red Pulp Physiology (Culling & Storage)
As blood flows through the porous sinusoids of the red pulp:
- Macrophages inspect passing red blood cells. Aging erythrocytes (older than 120 days) with stiff membranes are phagocytosed.
- Hemoglobin is broken down into globin proteins, iron (recycled), and bilirubin (sent to liver).
- The red pulp serves as a reservoir storing up to 30% of the body''s blood platelets.

### White Pulp Immune Function
Blood entering through central arteries passes through the white pulp. Resident dendritic cells and lymphocytes monitor blood-borne pathogens, initiating antibody production and T-cell activation.'),
(29, 10, 'Lymph Nodes', 'Small bean-shaped encapsulated lymphoid organs distributed along lymphatic vessels to filter lymph.', 'Filters interstitial lymph fluid to trap cellular debris and foreign micro-organisms;Serves as primary sites for antigen presentation and lymphocyte activation;Facilitates B-cell proliferation into antibody-secreting plasma cells.', '/images/lymph-node.jpg', '### Anatomy of Lymph Nodes
Lymph nodes are small, bean-shaped organs ranging from 1 to 25 mm in size, clustered along lymphatic vessels in regions such as the neck, axilla, and groin. Each node is surrounded by a dense fibrous capsule and organized into three main regions:
- **Cortex**: Outer layer containing lymphatic nodules (follicles) packed with B-lymphocytes.
- **Paracortex**: Middle region containing T-lymphocytes and high endothelial venules.
- **Medulla**: Inner core containing medullary cords (plasma cells and macrophages) and medullary sinuses.

### Lymph Circulation & Filtration
- Afferent lymphatic vessels penetrate the convex capsule, directing raw lymph into the subcapsular sinus.
- Lymph percolates slowly through cortical and medullary sinuses lined with phagocytic macrophages that engulf bacteria, viruses, and debris.
- Filtered lymph exits via efferent lymphatic vessels at the concave hilum.

### Immune Activation
When foreign antigens enter a lymph node:
- Antigen-presenting cells display processed peptides to helper T-cells in the paracortex.
- Activated B-cells in cortical germinal centers undergo rapid clonal expansion and differentiate into antibody-producing plasma cells.'),
(30, 10, 'Thymus', 'A bi-lobed primary lymphatic organ in the anterior mediastinum essential for T-lymphocyte maturation.', 'Differentiates progenitor cells into immunocompetent T-lymphocytes;Eliminates self-reactive T-cells through positive and negative selection;Secretes thymic hormones (thymosin) driving peripheral immune competency.', '/images/thymus.jpg', '### Anatomy of the Thymus
The thymus is a bi-lobed primary lymphoid organ positioned in the superior and anterior mediastinum posterior to the sternum. It reaches its maximum functional weight during puberty, after which it undergoes **involution**, gradually replacing functional lymphatic tissue with adipose and fibrous tissue. Each lobe is divided into lobules featuring an outer dense cortex and an inner pale medulla containing **Hassall''s corpuscles**.

### T-Cell Maturation & Education
Immature lymphoid progenitor cells (thymocytes) migrate from bone marrow to the thymic cortex:
1. **Positive Selection (Cortex)**: Epithelial cells test thymocytes for their ability to recognize self-MHC molecules. Thymocytes that fail undergo apoptosis.
2. **Negative Selection (Medulla)**: Dendritic cells present self-antigens. Thymocytes that bind too strongly to self-antigens are eliminated to prevent autoimmunity (central tolerance).
- Only 2-5% of thymocytes survive both selection steps to become mature naive CD4+ or CD8+ T-cells.

### Hormonal Secretions
The thymic stroma secretes a family of peptide hormones including **thymosin**, **thymopoietin**, and **thymulin**, which promote T-cell differentiation and systemic cell-mediated immunity.'),
(31, 11, 'Ovaries', 'Paired female primary reproductive gonads responsible for oocyte development and sex hormone secretion.', 'Produces mature female gametes (ova) through cyclic oogenesis;Synthesizes steroid sex hormones (estrogen and progesterone);Regulates the menstrual cycle and prepares the uterine lining for pregnancy.', '/images/ovaries.jpg', '### Anatomy of the Ovaries
The ovaries are paired almond-shaped glands situated in the pelvic cavity on either side of the uterus, held in place by the ovarian ligament and broad ligament. Histologically, each ovary consists of:
- **Germinal Epithelium & Tunica Albuginea**: Outer protective layers.
- **Ovarian Cortex**: Outer functional layer housing thousands of ovarian follicles in varying stages of development.
- **Ovarian Medulla**: Inner core containing neurovascular support structures.

### Oogenesis & Folliculogenesis
During each monthly ovarian cycle:
1. **Follicular Phase**: FSH stimulates several primordial follicles to mature into primary, secondary, and a single dominant **Graafian follicle**.
2. **Ovulation**: A mid-cycle surge of **Luteinizing Hormone (LH)** triggers rupture of the Graafian follicle, releasing a secondary oocyte into the peritoneal cavity near the fallopian tube.
3. **Luteal Phase**: The ruptured follicle transforms into the **corpus luteum**.

### Hormonal Function
- **Estrogen**: Secreted by developing follicular granulosal cells; drives female secondary sex characteristics and proliferative repair of the endometrium.
- **Progesterone**: Secreted by the corpus luteum; maintains a thickened, secretory endometrium suitable for blastocyst implantation.'),
(32, 11, 'Testes', 'Paired male primary reproductive gonads located in the scrotum, producing sperm and testosterone.', 'Produces male gametes (spermatozoa) continuously via spermatogenesis;Synthesizes male androgen hormones (primarily testosterone);Regulates male secondary sexual characteristics and reproductive drive.', '/images/testes.jpg', '### Anatomy of the Testes
The testes (testicles) are paired oval gonads suspended outside the abdominopelvic cavity within the cutaneous **scrotum**. Each testis is wrapped by the fibrous tunica albuginea, which divides the interior into 200-300 lobules. Each lobule contains 1 to 4 highly coiled **seminiferous tubules**, the sites of active sperm production.

### Spermatogenesis & Temperature Control
- **Scrotal Thermoregulation**: Spermatogenesis requires a temperature 2-3°C cooler than normal core body temperature. The dartos and cremaster muscles contract or relax to move the testes closer to or further from the body.
- **Tubular Cell Structure**:
  - **Spermatogenic Cells**: Stem cells undergoing mitotic and meiotic divisions to form haploid spermatozoa.
  - **Sertoli Cells (Sustentacular Cells)**: Form the blood-testis barrier, nourish developing sperm, and secrete androgen-binding protein.

### Testosterone Physiology
Interspersed between seminiferous tubules are **interstitial Leydig cells**. In response to pituitary LH stimulation, Leydig cells synthesize **Testosterone**, which promotes spermatogenesis, muscle growth, bone density, and male secondary sex traits.'),
(33, 11, 'Uterus', 'A thick-walled muscular organ in the female pelvis designed to nourish and house a developing fetus.', 'Provides site for blastocyst implantation and embryonic development;Nourishes the developing fetus throughout gestation;Expels the fetus during labor via forceful myometrial contractions.', '/images/uterus.jpg', '### Anatomy of the Uterus
The uterus (womb) is a hollow, thick-walled pear-shaped organ located in the female pelvis between the urinary bladder and rectum. It is divided into three structural regions: the superior **fundus**, central **body**, and inferior narrowing **cervix**. Its wall consists of three distinct anatomical layers:
- **Perimetrium**: Outer serous membrane layer.
- **Myometrium**: Massive middle layer of interlocking smooth muscle bundles.
- **Endometrium**: Inner mucosal lining divided into a functional layer (stratum functionalis) and basal layer (stratum basalis).

### Endometrial Uterine Cycle
Driven by ovarian hormones, the functionalis undergoes 28-day cyclic changes:
- **Menstrual Phase (Days 1-5)**: Shedding of stratum functionalis due to progesterone drop.
- **Proliferative Phase (Days 6-14)**: Estrogen stimulates rapid endometrial repair and glandular growth.
- **Secretory Phase (Days 15-28)**: Progesterone causes endometrial glands to secrete glycogen-rich fluid for blastocyst reception.

### Gestation & Parturition
If fertilization occurs, the blastocyst implants into the secretory endometrium. During pregnancy, the myometrium undergoes extreme hypertrophy. At term, rising oxytocin levels trigger rhythmic, high-force myometrial contractions to deliver the infant.'),
(34, 11, 'Fallopian Tubes', 'Paired muscular tubes extending laterally from the uterus toward each ovary, facilitating ovum transport and fertilization.', 'Transports secondary oocyte from ovary toward the uterus;Serves as the primary physiological site of fertilization;Nourishes early cleaving embryo prior to uterine entry.', '/images/fallopian-tube.jpg', '### Anatomy of the Fallopian Tubes
The fallopian tubes (uterine tubes or oviducts) are paired muscular tubes approximately 10-12 cm long extending laterally from the superior outer angles of the uterus toward each ovary. Each tube is divided into four distinct anatomical regions:
- **Infundibulum**: The funnel-shaped distal expansion ending in finger-like projections called **fimbriae** that drape over the ovary.
- **Ampulla**: The wide, curved middle segment comprising two-thirds of the tube length.
- **Isthmus**: The narrow, thick-walled medial third connecting to the uterine wall.
- **Interstitial (Intramural) Segment**: The short portion passing directly through the myometrial wall of the uterus.

### Wall Structure & Transport Physiology
The fallopian tube wall consists of three functional layers:
1. **Mucosa**: Lined with simple columnar epithelium containing **ciliated cells** (which beat rhythmically toward the uterus) and non-ciliated **peg cells** (which secrete nutrient-rich fluid).
2. **Muscularis**: Inner circular and outer longitudinal smooth muscle layers.
3. **Serosa**: Outer visceral peritoneal covering.

### Physiology of Ovum Capture & Fertilization
At ovulation, sweeping movements of the fimbriae and fluid currents draw the released oocyte into the infundibulum.
- **Site of Fertilization**: Fertilization typically occurs in the **ampulla** within 12-24 hours post-ovulation.
- **Embryonic Transport**: Ciliary beating combined with smooth muscle peristalsis moves the fertilized zygote toward the uterine cavity over 3-4 days while peg cell secretions nourish the developing cleavage-stage embryo.'),
(35, 11, 'Prostate Gland', 'A walnut-sized exocrine gland surrounding the male urethra inferior to the bladder, producing seminal fluid.', 'Secretes slightly alkaline fluid that neutralizes acidic vaginal secretions;Produces prostate-specific antigen (PSA) to liquefy semen post-ejaculation;Contracts smooth muscle stroma during ejaculation to push seminal fluid.', '/images/prostate-gland.jpg', '### Anatomy of the Prostate Gland
The prostate is a firm, walnut-sized exocrine gland located in the male pelvis directly inferior to the urinary bladder and anterior to the rectum. It completely encircles the **prostatic urethra**. The gland is enclosed by a dense fibrous capsule and is structurally divided into four anatomical zones:
- **Peripheral Zone (70%)**: Posterior region felt during digital rectal examination; the primary site of prostate adenocarcinoma.
- **Transition Zone (5%)**: Surrounds the proximal urethra; the primary site of benign prostatic hyperplasia (BPH).
- **Central Zone (25%)**: Surrounds the ejaculatory ducts.
- **Anterior Fibromuscular Stroma**: Non-glandular tissue composed of smooth muscle and collagen.

### Prostatic Secretions & Physiology
The prostate contributes approximately 30% of total ejaculate volume. Its glandular epithelium secretes a thin, milky, slightly alkaline fluid (pH ~6.5) containing:
- **Citric Acid**: Nutrient substrate for sperm ATP production.
- **Zinc**: High concentrations stabilizing sperm chromatin.
- **Prostate-Specific Antigen (PSA)**: A serine protease enzyme that breaks down seminal clotting proteins (semenogelin) post-ejaculation, liquefying semen to allow sperm to swim freely.

### Clinical & Functional Aspects
During ejaculation, smooth muscle in the fibromuscular stroma contracts under sympathetic control to expel prostatic fluid into the urethra. As men age, dihydrotestosterone (DHT) stimulates transition zone hypertrophy (**BPH**), which compresses the prostatic urethra and causes urinary hesitancy and weak stream.')
ON CONFLICT (id) DO UPDATE SET system_id = EXCLUDED.system_id, name = EXCLUDED.name, description = EXCLUDED.description, functions = EXCLUDED.functions, image_url = EXCLUDED.image_url, study_notes = EXCLUDED.study_notes;

-- 3. Insert Permanent Demo User Sitta (password: password123)
INSERT INTO users (id, username, email, password_hash) VALUES
(1, 'Sitta', 'sitta@example.com', '$2a$10$Hx.xGKoQp58p54BRIgZBv.lerQkL/JhdW1KWjfp9LhdErq8IviNqy')
ON CONFLICT (id) DO UPDATE SET username = EXCLUDED.username, email = EXCLUDED.email, password_hash = EXCLUDED.password_hash;

-- 4. Insert Sample Health Logs for Sitta
INSERT INTO health_logs (id, user_id, log_date, weight_kg, height_cm, bmi, blood_pressure, heart_rate, notes) VALUES
(1, 1, '2026-07-10', 72.50, 175.00, 23.67, '120/80', 70, 'Initial scan. Felt energetic after class.'),
(2, 1, '2026-07-13', 71.80, 175.00, 23.44, '118/79', 68, 'Logged after morning jog.'),
(3, 1, '2026-07-16', 72.00, 175.00, 23.51, '119/80', 67, 'Feeling relaxed before exam week.')
ON CONFLICT (id) DO UPDATE SET user_id = EXCLUDED.user_id, log_date = EXCLUDED.log_date, weight_kg = EXCLUDED.weight_kg, height_cm = EXCLUDED.height_cm, bmi = EXCLUDED.bmi, blood_pressure = EXCLUDED.blood_pressure, heart_rate = EXCLUDED.heart_rate, notes = EXCLUDED.notes;

-- 5. Insert Quiz Questions (10 per organ, aligned to Study Notes)
INSERT INTO quiz_questions (id, organ_id, question_text, option_a, option_b, option_c, option_d, correct_option, explanation) VALUES
-- HEART (Organ 1)
(1, 1, 'Which chamber of the heart pumps oxygenated blood into the aorta to circulate through the body?', 'Right Atrium', 'Left Atrium', 'Right Ventricle', 'Left Ventricle', 'D', 'The left ventricle is the thickest chamber, responsible for pumping oxygen-rich blood into the aorta for systemic circulation.'),
(2, 1, 'What is the standard, healthy average blood pressure reading for an adult?', '120/80 mmHg', '140/90 mmHg', '90/60 mmHg', '160/100 mmHg', 'A', 'A blood pressure reading of 120/80 mmHg is generally considered normal and healthy for adults.'),
(3, 1, 'Which blood vessels carry oxygen-depleted blood back to the heart?', 'Arteries', 'Capillaries', 'Veins', 'Lymphatics', 'C', 'Veins are the blood vessels that collect deoxygenated blood and return it to the heart.'),
(4, 1, 'What is the double-walled protective sac that encloses the heart?', 'Myocardium', 'Endocampium', 'Pericardium', 'Epicardium', 'C', 'The pericardium is the double-walled membrane sac that encloses and protects the heart.'),
(5, 1, 'Which chambers function as the receiving chambers of the heart?', 'Ventricles', 'Atria', 'Aortas', 'Venae cavae', 'B', 'The right and left atria function as the receiving chambers for blood returning to the heart.'),
(6, 1, 'What is the relaxation and filling phase of the cardiac cycle called?', 'Systole', 'Diastole', 'Peristalsis', 'Depolarization', 'B', 'Diastole is the phase of the cardiac cycle when the heart muscle relaxes and the chambers fill with blood.'),
(7, 1, 'Which valve lies between the right atrium and the right ventricle to prevent backflow?', 'Mitral valve', 'Aortic valve', 'Tricuspid valve', 'Pulmonary valve', 'C', 'The tricuspid valve separates the right atrium and right ventricle, preventing backflow of blood.'),
(8, 1, 'What is the normal resting heart rate range for healthy adults?', '40 to 60 bpm', '60 to 100 bpm', '100 to 120 bpm', '50 to 80 bpm', 'B', 'A normal resting heart rate for healthy adults is typically between 60 and 100 beats per minute.'),
(9, 1, 'Which vessel carries oxygen-rich blood from the lungs back to the left atrium?', 'Pulmonary artery', 'Pulmonary vein', 'Superior vena cava', 'Aorta', 'B', 'Pulmonary veins carry freshly oxygenated blood from the lungs back to the left atrium of the heart.'),
(10, 1, 'Why is the left ventricle significantly thicker and more muscular than the right ventricle?', 'It pumps blood to the lungs', 'It receives blood from the vena cava', 'It pumps blood to the entire body', 'It regulates the resting heart rate', 'C', 'The left ventricle has a thicker wall to generate the high pressure needed to pump blood to the entire body via the aorta.'),

-- BLOOD VESSELS (Organ 2)
(11, 2, 'Which blood vessels have the thinnest walls, consisting of a single cell layer?', 'Arteries', 'Veins', 'Capillaries', 'Venules', 'C', 'Capillaries are microscopic, one-cell-thick vessels that facilitate gas and nutrient exchange.'),
(12, 2, 'What is the primary function of one-way valves found inside veins?', 'Speed up blood flow rate', 'Increase arterial blood pressure', 'Prevent backflow of blood', 'Filter out small blood clots', 'C', 'Veins operate under low pressure, so one-way valves prevent gravity from pulling blood backwards.'),
(13, 2, 'Which type of blood vessel has thick, elastic walls to withstand high pressure?', 'Veins', 'Capillaries', 'Lymphatics', 'Arteries', 'D', 'Arteries carry blood directly away from the heart, requiring thick elastic walls to handle high pressure.'),
(14, 2, 'What physiological term describes the narrowing of a blood vessel lumen to increase blood pressure?', 'Vasodilation', 'Vasoconstriction', 'Peristalsis', 'Atherosclerosis', 'B', 'Vasoconstriction is the narrowing of vessel walls, which increases resistance and blood pressure.'),
(15, 2, 'What is the largest artery in the human body?', 'Vena Cava', 'Aorta', 'Pulmonary Artery', 'Femoral Artery', 'B', 'The aorta is the largest artery in the body, carrying blood out from the left ventricle.'),
(16, 2, 'Which blood vessel layer allows rapid diffusion of substances?', 'Tunica externa', 'Tunica media', 'Tunica intima', 'Valves', 'C', 'The tunica intima is a thin endothelial layer that makes up capillary walls, facilitating diffusion.'),
(17, 2, 'Which major veins return oxygen-poor blood to the right atrium from the upper and lower body?', 'Pulmonary veins', 'Venae cavae', 'Aortas', 'Arterioles', 'B', 'The superior and inferior venae cavae return deoxygenated blood to the right atrium.'),
(18, 2, 'What mechanism squeezes venous blood back toward the heart against gravity?', 'Cardiac contraction', 'Skeletal muscle contractions', 'Arterial pulse', 'Vasodilation', 'B', 'Contraction of surrounding skeletal muscles squeezes blood in veins upward.'),
(19, 2, 'What term describes the widening of blood vessels to lower blood pressure?', 'Vasoconstriction', 'Vasodilation', 'Peristalsis', 'Osmosis', 'B', 'Vasodilation is the relaxation of vascular smooth muscle, expanding the lumen and dropping pressure.'),
(20, 2, 'Capillaries physically connect which two components of the vascular network?', 'Arteries and veins', 'Arterioles and venules', 'Atria and ventricles', 'Aorta and vena cava', 'B', 'Capillaries form beds that bridge the transition from tiny arterioles to venules.'),

-- BRAIN (Organ 3)
(21, 3, 'Which protective membrane layers enclose and protect the brain?', 'Pleura', 'Pericardium', 'Meninges', 'Peritoneum', 'C', 'The brain is protected by three membrane layers collectively called the meninges.'),
(22, 3, 'Which brain region handles high-level cognitive tasks, reasoning, and speech?', 'Occipital lobe', 'Temporal lobe', 'Frontal lobe', 'Parietal lobe', 'C', 'The frontal lobe is responsible for higher cognitive functions, decision-making, and speech.'),
(23, 3, 'What division of the brain coordinates voluntary movement, balance, and posture?', 'Brainstem', 'Cerebellum', 'Thalamus', 'Hypothalamus', 'B', 'The cerebellum coordinates balance, posture, and fine motor movement.'),
(24, 3, 'What fluid cushions the brain and spinal cord from physical impact?', 'Blood plasma', 'Cerebrospinal fluid', 'Lymph', 'Synovial fluid', 'B', 'Cerebrospinal fluid (CSF) cushions and protects the central nervous system organs.'),
(25, 3, 'Which lobe of the cerebral cortex is primarily responsible for processing visual information?', 'Frontal Lobe', 'Parietal Lobe', 'Occipital Lobe', 'Temporal Lobe', 'C', 'The occipital lobe at the back of the head processes visual inputs.'),
(26, 3, 'Which brainstem division controls critical involuntary life functions like breathing?', 'Cerebrum', 'Cerebellum', 'Medulla oblongata', 'Thalamus', 'C', 'The brainstem, including the medulla oblongata, regulates breathing, heart rate, and blood pressure.'),
(27, 3, 'What is the outer gray matter surface of the cerebrum called?', 'Myelin sheath', 'Cerebral cortex', 'Meninges', 'Thalamus', 'B', 'The cerebral cortex is the outer layer of gray matter governing conscious thought.'),
(28, 3, 'Which structure acts as the primary sensory relay station routing signals to the cortex?', 'Hypothalamus', 'Thalamus', 'Pons', 'Midbrain', 'B', 'The thalamus receives incoming sensory signals and routes them to the correct cortical region.'),
(29, 3, 'Which brain region regulates homeostasis, body temperature, and hunger?', 'Cerebellum', 'Hypothalamus', 'Frontal Lobe', 'Medulla', 'B', 'The hypothalamus controls homeostatic balances, body temperature, hunger, and thirst.'),
(30, 3, 'Which lobe is associated with hearing, memory, and language comprehension?', 'Parietal Lobe', 'Temporal Lobe', 'Occipital Lobe', 'Frontal Lobe', 'B', 'The temporal lobe handles auditory processing, memory storage, and language comprehension.'),

-- SPINAL CORD (Organ 4)
(31, 4, 'What is the primary role of the spinal cord in the nervous system?', 'Pumping blood to the head', 'Secreting digestive enzymes', 'Transmitting signals between the brain and the body', 'Producing white blood cells', 'C', 'The spinal cord serves as the main transmission highway for sensory and motor signals between the brain and the rest of the body.'),
(32, 4, 'In a spinal cord cross-section, what shape does the inner gray matter resemble?', 'Star', 'Triangle', 'Butterfly', 'Circle', 'C', 'The gray matter of the spinal cord is centrally located and resembles a butterfly or the letter ''H''.'),
(33, 4, 'How many pairs of spinal nerves branch off from the spinal cord?', '12 pairs', '31 pairs', '43 pairs', '24 pairs', 'B', 'There are exactly 31 pairs of spinal nerves that emerge from the spinal cord to connect to the body.'),
(34, 4, 'Which root of the spinal nerve carries incoming sensory signals into the spinal cord?', 'Ventral root', 'Dorsal root', 'Lateral root', 'Medial root', 'B', 'The dorsal root is dedicated solely to carrying sensory information into the spinal cord.'),
(35, 4, 'Where are the cell bodies of sensory neurons located?', 'Dorsal root ganglion', 'Gray matter', 'Ventral root', 'Brainstem', 'A', 'The dorsal root ganglion is an enlargement on the dorsal root that houses the cell bodies of sensory neurons.'),
(36, 4, 'What type of rapid, involuntary response is coordinated entirely within the spinal cord without brain involvement?', 'Voluntary action', 'Autonomic pulse', 'Spinal reflex', 'Cognitive decision', 'C', 'Spinal reflexes bypass the brain to allow rapid protective actions, processed directly by a reflex arc in the spinal cord.'),
(37, 4, 'Which root of the spinal nerve carries outgoing motor commands away from the spinal cord?', 'Ventral root', 'Dorsal root', 'Ganglionic root', 'Sensory root', 'A', 'The ventral root contains motor fibers that carry commands out from the spinal cord to muscles and glands.'),
(38, 4, 'What makes up the outer white matter of the spinal cord?', 'Neuronal cell bodies', 'Synaptic junctions', 'Myelinated nerve tracts', 'Bony fragments', 'C', 'The white matter contains columns of myelinated nerve fibers (axons) running up and down the spinal cord.'),
(39, 4, 'The spinal cord extends directly from which part of the brainstem?', 'Cerebrum', 'Medulla oblongata', 'Cerebellum', 'Midbrain', 'B', 'The spinal cord is a direct physical continuation of the medulla oblongata at the base of the skull.'),
(40, 4, 'What bony structures protect the spinal cord along the back?', 'Ribs', 'Vertebrae', 'Meninges', 'Skull', 'B', 'The vertebral column (spine) is made of bones called vertebrae that surround and protect the spinal cord.'),
-- SKULL (Organ 5)
(41, 5, 'How many individual bones compose the adult human skull?', '8 bones', '14 bones', '22 bones', '33 bones', 'C', 'The adult human skull is composed of exactly 22 bones, divided into cranial and facial bones.'),
(42, 5, 'Which skull bone is the only movable bone?', 'Maxilla', 'Mandible', 'Frontal bone', 'Temporal bone', 'B', 'The mandible (lower jaw) is the only movable bone in the skull, allowing mastication and speech.'),
(43, 5, 'What joints connect most skull bones together immovably?', 'Synovial joints', 'Cartilaginous joints', 'Sutures', 'Ball-and-socket joints', 'C', 'Skull bones are firmly held together by fibrous, immovable joints called sutures.'),
(44, 5, 'How many cranial bones make up the cranium to protect the brain?', '8 bones', '14 bones', '12 bones', '22 bones', 'A', 'There are 8 cranial bones that enclose and protect the brain in the cranial cavity.'),
(45, 5, 'How many facial bones form the structural framework of the face?', '8 bones', '14 bones', '22 bones', '10 bones', 'B', 'The facial skeleton consists of exactly 14 bones.'),
(46, 5, 'What is the physiological process of chewing food called?', 'Peristalsis', 'Mastication', 'Deglutition', 'Segmentation', 'B', 'Mastication is the medical term for the chewing of food, facilitated by muscles pulling on the mandible.'),
(47, 5, 'Which bones form the protective vault enclosing the brain?', 'Facial bones', 'Cranial bones', 'Sutures', 'Vertebrae', 'B', 'Cranial bones form the cranium, protecting the brain from trauma.'),
(48, 5, 'Which of the following is NOT a cranial bone?', 'Frontal bone', 'Mandible', 'Parietal bone', 'Occipital bone', 'B', 'The mandible is a facial bone, while frontal, parietal, and occipital are cranial bones.'),
(49, 5, 'Where do muscles of facial expression primarily attach?', 'The brain', 'Facial bones', 'The tongue', 'The cervical spine', 'B', 'Skeletal muscles of facial expression attach directly to facial bones to pull the skin.'),
(50, 5, 'Which cavities in the skull house the organs of vision?', 'Middle ear cavities', 'Orbits', 'Nasal cavity', 'Sinuses', 'B', 'The orbits are the bony sockets that house and protect the eyes.'),

-- SPINE (Organ 6)
(51, 6, 'How many total vertebrae are initially present in the vertebral column?', '24 vertebrae', '33 vertebrae', '26 vertebrae', '12 vertebrae', 'B', 'The spine initially consists of 33 vertebrae before sacral and coccygeal fusion.'),
(52, 6, 'How many cervical vertebrae are located in the neck region?', '5 vertebrae', '7 vertebrae', '12 vertebrae', '4 vertebrae', 'B', 'There are 7 cervical vertebrae in the neck of humans (C1-C7).'),
(53, 6, 'Which spinal region consists of 12 vertebrae that attach to the ribs?', 'Cervical', 'Thoracic', 'Lumbar', 'Sacral', 'B', 'The thoracic region consists of 12 vertebrae (T1-T12) that articulate with the 12 pairs of ribs.'),
(54, 6, 'Which vertebrae are the largest to bear the weight of the upper body?', 'Cervical', 'Thoracic', 'Lumbar', 'Sacral', 'C', 'Lumbar vertebrae are the largest because they bear the most upper body weight.'),
(55, 6, 'What fibrocartilaginous structures sit between vertebrae to absorb shock?', 'Sutures', 'Intervertebral discs', 'Costal cartilages', 'Synovial capsules', 'B', 'Intervertebral discs of fibrocartilage absorb shock and allow spinal flexibility.'),
(56, 6, 'The sacrum is composed of how many fused vertebrae?', '3 vertebrae', '5 vertebrae', '4 vertebrae', '7 vertebrae', 'B', 'The sacrum consists of 5 fused vertebrae in adults.'),
(57, 6, 'What is the common name for the coccyx?', 'Collarbone', 'Tailbone', 'Breastbone', 'Hipbone', 'B', 'The coccyx is commonly referred to as the tailbone.'),
(58, 6, 'What nervous system structure runs through and is protected by the spinal column?', 'Cranial nerves', 'Spinal cord', 'Cerebrum', 'Sciatic nerve', 'B', 'The vertebral canal contains and protects the spinal cord.'),
(59, 6, 'Which spinal region allows head rotation and tilting?', 'Thoracic', 'Cervical', 'Lumbar', 'Sacral', 'B', 'The cervical spine (neck) facilitates head rotation and movement.'),
(60, 6, 'What help distribute body weight and maintain balance in the spine?', 'Sutures', 'Natural curves', 'Teniae coli', 'Condyles', 'B', 'The natural curves of the spine distribute load and assist in balance.'),

-- RIBCAGE (Organ 7)
(61, 7, 'How many total ribs are in the human ribcage?', '12 ribs', '24 ribs', '10 ribs', '33 ribs', 'B', 'There are 12 pairs of ribs, making 24 ribs in total.'),
(62, 7, 'Which ribs connect directly to the sternum via costal cartilage?', 'False ribs', 'True ribs', 'Floating ribs', 'Vertebral ribs', 'B', 'True ribs (pairs 1-7) connect directly to the sternum via costal cartilage.'),
(63, 7, 'How many pairs of true ribs are present in the ribcage?', '5 pairs', '7 pairs', '10 pairs', '12 pairs', 'B', 'There are exactly 7 pairs of true ribs.'),
(64, 7, 'What is the medical name for the breastbone?', 'Clavicle', 'Sternum', 'Scapula', 'Patella', 'B', 'The sternum is the medical term for the breastbone.'),
(65, 7, 'What ribs make up pairs 11 and 12, having no anterior connection?', 'True ribs', 'False ribs', 'Floating ribs', 'Cervical ribs', 'C', 'Floating ribs have no anterior connection and end freely.'),
(66, 7, 'How do false ribs (pairs 8-10) connect to the sternum?', 'Directly', 'Indirectly via rib 7 cartilage', 'They do not connect', 'Via spinal muscles', 'B', 'False ribs connect indirectly by attaching to the costal cartilage of rib 7.'),
(67, 7, 'What connective tissue strip attaches true ribs to the sternum?', 'Tendons', 'Costal cartilage', 'Ligaments', 'Sutures', 'B', 'Costal cartilage provides the flexible connection between ribs and the sternum.'),
(68, 7, 'Which vital organs are primarily protected by the ribcage?', 'Brain and spine', 'Heart and lungs', 'Stomach and liver', 'Kidneys and bladder', 'B', 'The ribcage shields the heart, lungs, and major thoracic blood vessels.'),
(69, 7, 'The ribcage assists in respiration by doing what during inhalation?', 'Contracting downward', 'Pivoting upward and outward', 'Remaining completely rigid', 'Detaching from the spine', 'B', 'During inhalation, ribs lift upward and outward to expand thoracic volume.'),
(70, 7, 'To which vertebrae do all ribs attach posteriorly?', 'Cervical', 'Thoracic', 'Lumbar', 'Sacral', 'B', 'All 12 pairs of ribs attach posteriorly to the 12 thoracic vertebrae.'),

-- FEMUR (Organ 8)
(71, 8, 'Which is the longest, heaviest, and strongest bone in the human body?', 'Tibia', 'Femur', 'Humerus', 'Fibula', 'B', 'The femur (thigh bone) is the longest and strongest bone in the skeletal system.'),
(72, 8, 'Where is the femur bone located?', 'Upper arm', 'Thigh', 'Lower leg', 'Lower back', 'B', 'The femur forms the skeletal structure of the thigh.'),
(73, 8, 'The head of the femur articulates with which socket of the pelvis?', 'Glenoid cavity', 'Acetabulum', 'Foramen magnum', 'Obturator foramen', 'B', 'The femur head fits into the pelvic acetabulum to form the hip joint.'),
(74, 8, 'What physiological process occurs inside the red bone marrow of the femur?', 'Hematopoiesis', 'Hemodynamics', 'Homeostasis', 'Vasodilation', 'B', 'Hematopoiesis (blood cell production) occurs in the red bone marrow of spongy bone.'),
(75, 8, 'Which bone does the femur articulate with distally at the knee joint?', 'Fibula', 'Tibia', 'Radius', 'Ulna', 'B', 'The femur articulates distally with the tibia (shin bone) and the patella.'),
(76, 8, 'Which part of the femur is particularly prone to fracture in older adults?', 'Shaft', 'Neck', 'Condyle', 'Trochanter', 'B', 'The narrow neck of the femur is a frequent site of fracture, especially in osteoporotic patients.'),
(77, 8, 'What is the patella commonly known as?', 'Thighbone', 'Kneecap', 'Shinbone', 'Collarbone', 'B', 'The patella is the kneecap, which articulates with the distal femur.'),
(78, 8, 'The femur belongs to which class of bones?', 'Flat bones', 'Long bones', 'Short bones', 'Irregular bones', 'B', 'The femur is classified as a long bone due to its tubular shaft and epiphyses.'),
(79, 8, 'Where is spongy (trabecular) bone containing red marrow located in the femur?', 'Inside the shaft middle', 'In the proximal epiphysis', 'On the outer periosteum', 'Within the articular cartilage', 'B', 'Spongy bone containing red marrow is located in the proximal epiphysis.'),
(80, 8, 'What are the large articulation rollers at the distal end of the femur called?', 'Sutures', 'Condyles', 'Processes', 'Fossae', 'B', 'The distal end features medial and lateral condyles that articulate with the tibia.'),

-- BICEPS (Organ 9)
(81, 9, 'What does the term "biceps" refer to regarding its structure?', 'Two insertion tendons', 'Two skeletal heads', 'Two joints crossed', 'Two types of muscle fibers', 'B', 'The biceps brachii has two distinct heads (origins) that merge into one muscle body.'),
(82, 9, 'Where is the biceps brachii muscle located?', 'Posterior arm', 'Anterior upper arm', 'Anterior thigh', 'Forearm', 'B', 'The biceps is on the anterior upper arm.'),
(83, 9, 'Into which forearm bone does the biceps tendon insert?', 'Ulna', 'Radius', 'Humerus', 'Scapula', 'B', 'The biceps tendon inserts into the radial tuberosity of the radius bone.'),
(84, 9, 'What is the primary action of the biceps brachii at the elbow joint?', 'Elbow extension', 'Elbow flexion', 'Forearm pronation', 'Shoulder abduction', 'B', 'The biceps is the prime mover (agonist) for bending (flexing) the elbow.'),
(85, 9, 'What forearm rotation does the biceps perform, turning the palm upward?', 'Pronation', 'Supination', 'Circumduction', 'Adduction', 'B', 'Forearm supination turns the palm upward, facilitated heavily by the biceps.'),
(86, 9, 'The heads of the biceps brachii originate from which skeletal structure?', 'Clavicle', 'Scapula', 'Humerus', 'Sternum', 'B', 'Both the short and long heads of the biceps originate from landmarks on the scapula.'),
(87, 9, 'Which nerve supplies motor signals to trigger biceps contraction?', 'Radial nerve', 'Musculocutaneous nerve', 'Sciatic nerve', 'Phrenic nerve', 'B', 'The musculocutaneous nerve innervates the anterior compartment of the arm.'),
(88, 9, 'How do actin and myosin filaments interact during biceps contraction?', 'They stretch longer', 'They slide past each other', 'They disconnect completely', 'They multiply in number', 'B', 'Muscle contraction occurs when actin and myosin slide past each other, shortening sarcomeres.'),
(89, 9, 'What is the specific insertion site of the biceps on the radius?', 'Styloid process', 'Radial tuberosity', 'Olecranon process', 'Head of radius', 'B', 'The biceps inserts into the radial tuberosity.'),
(90, 9, 'Because it crosses the shoulder joint, the biceps also assists in:', 'Shoulder extension', 'Shoulder flexion', 'Shoulder rotation', 'Shoulder abduction', 'B', 'The biceps crosses the shoulder joint and can assist in shoulder flexion.'),

-- QUADRICEPS (Organ 10)
(91, 10, 'How many individual muscles make up the quadriceps group?', '3 muscles', '4 muscles', '5 muscles', '2 muscles', 'B', 'The quadriceps femoris is a group of 4 muscles on the anterior thigh.'),
(92, 10, 'Where is the quadriceps group located?', 'Posterior thigh', 'Anterior thigh', 'Lower leg calf', 'Anterior arm', 'B', 'The quadriceps group is located on the front (anterior) of the thigh.'),
(93, 10, 'Which of the four quadriceps muscles crosses the hip joint to assist in hip flexion?', 'Vastus lateralis', 'Rectus femoris', 'Vastus medialis', 'Vastus intermedius', 'B', 'The rectus femoris crosses the hip joint, enabling it to assist in hip flexion.'),
(94, 10, 'What is the primary action of the quadriceps group at the knee?', 'Knee flexion', 'Knee extension', 'Knee rotation', 'Knee abduction', 'B', 'The primary role of the quadriceps is knee extension (straightening the leg).'),
(95, 10, 'The quadriceps muscles merge into a single tendon that inserts into which bone?', 'Tibia', 'Patella', 'Femur', 'Fibula', 'B', 'The muscles merge into the quadriceps tendon, which inserts into the patella.'),
(96, 10, 'The patella connects to the tibia via which structure?', 'Quadriceps tendon', 'Patellar ligament', 'Achilles tendon', 'Collateral ligament', 'B', 'The patellar ligament continues from the patella to insert onto the tibia.'),
(97, 10, 'Which quadriceps muscle is located on the outer part of the thigh?', 'Vastus medialis', 'Vastus lateralis', 'Rectus femoris', 'Vastus intermedius', 'B', 'The vastus lateralis is situated on the lateral (outer) side of the thigh.'),
(98, 10, 'Which nerve innervates the quadriceps femoris group?', 'Sciatic nerve', 'Femoral nerve', 'Obturator nerve', 'Tibial nerve', 'B', 'The femoral nerve supplies motor signals to the quadriceps.'),
(99, 10, 'How does the patella assist the quadriceps mechanically?', 'By absorbing impact', 'By acting as a pulley to increase force', 'By locking the joint', 'By producing red blood cells', 'B', 'The patella acts as a pulley, increasing the leverage and mechanical advantage of the quadriceps.'),
(100, 10, 'Which vastus muscle lies directly underneath the rectus femoris?', 'Vastus medialis', 'Vastus intermedius', 'Vastus lateralis', 'Vastus deepus', 'B', 'The vastus intermedius lies deep to the rectus femoris on the femur shaft.'),

-- SKELETAL MUSCLE (Organ 11)
(101, 11, 'Skeletal muscle tissue is under what type of physiological control?', 'Involuntary', 'Voluntary', 'Autonomic', 'Hormonal', 'B', 'Skeletal muscle contraction is voluntary, controlled by the somatic nervous system.'),
(102, 11, 'What connective tissue layer wraps the entire skeletal muscle body?', 'Perimysium', 'Epimysium', 'Endomysium', 'Fascia', 'B', 'The epimysium is the dense outer wrapper surrounding the entire muscle.'),
(103, 11, 'What are bundles of muscle fibers wrapped in perimysium called?', 'Myofibrils', 'Fascicles', 'Sarcomeres', 'Tendons', 'B', 'Fascicles are bundles of muscle fibers wrapped by perimysium.'),
(104, 11, 'What is the functional contractile unit of a muscle fiber?', 'Fascicle', 'Sarcomere', 'Myofilament', 'T-tubule', 'B', 'The sarcomere is the repeating structural unit of contraction in myofibrils.'),
(105, 11, 'Which two proteins form the sliding filaments during contraction?', 'Collagen and keratin', 'Actin and myosin', 'Elastin and fibrin', 'Albumin and globulin', 'B', 'Sarcomeres contain thick filaments of myosin and thin filaments of actin.'),
(106, 11, 'Which neurotransmitter initiates skeletal muscle contraction at the neuromuscular junction?', 'Dopamine', 'Acetylcholine', 'Serotonin', 'Epinephrine', 'B', 'Somatic motor neurons release acetylcholine (ACh) to trigger contraction.'),
(107, 11, 'Which ions are released from the sarcoplasmic reticulum to trigger contraction?', 'Sodium ions', 'Calcium ions', 'Potassium ions', 'Chloride ions', 'B', 'Calcium ions bind to troponin, exposing active sites on actin for myosin binding.'),
(108, 11, 'What tissue sheath surrounds each individual muscle fiber?', 'Epimysium', 'Endomysium', 'Perimysium', 'Sarcolemma', 'B', 'The endomysium is the delicate connective tissue wrapping each individual fiber.'),
(109, 11, 'What theory explains the contraction mechanism of skeletal muscles?', 'Lock and key theory', 'Sliding filament theory', 'Fluid mosaic theory', 'Gene theory', 'B', 'The sliding filament theory describes how thin and thick filaments slide past each other.'),
(110, 11, 'Skeletal muscles are connected to bones by what structures?', 'Ligaments', 'Tendons', 'Cartilage', 'Sutures', 'B', 'Skeletal muscles are connected to bones by tendons.'),

-- LUNGS (Organ 12)
(111, 12, 'How many lobes are present in the right lung?', '2 lobes', '3 lobes', '4 lobes', '5 lobes', 'B', 'The right lung is divided into 3 lobes: superior, middle, and inferior.'),
(112, 12, 'How many lobes compose the left lung?', '2 lobes', '3 lobes', '4 lobes', '1 lobe', 'A', 'The left lung has 2 lobes to accommodate the heart in the thoracic cavity.'),
(113, 12, 'What double-layered membrane surrounds and cushions the lungs?', 'Pericardium', 'Pleura', 'Peritoneum', 'Meninges', 'B', 'The pleura is the protective serous membrane surrounding each lung.'),
(114, 12, 'What microscopic air sacs are the primary sites of gas exchange?', 'Bronchioles', 'Alveoli', 'Primary bronchi', 'Tracheal rings', 'B', 'Alveoli are microscopic sacs where oxygen and carbon dioxide are exchanged.'),
(115, 12, 'What phospholipid fluid is secreted to prevent alveoli from collapsing?', 'Saliva', 'Surfactant', 'Mucus', 'Bile', 'B', 'Surfactant reduces surface tension inside alveoli, preventing collapse.'),
(116, 12, 'During external respiration, oxygen diffuses from alveoli into where?', 'Bronchial arteries', 'Pulmonary capillaries', 'Visceral pleura', 'Lymph vessels', 'B', 'Oxygen diffuses across the thin membrane into pulmonary capillary blood.'),
(117, 12, 'What physical process drives the exchange of gases across the respiratory membrane?', 'Active transport', 'Simple diffusion', 'Osmosis', 'Filtration', 'B', 'Gas exchange is driven by simple diffusion along partial pressure gradients.'),
(118, 12, 'Which gas is excreted from the blood into alveoli to be exhaled?', 'Oxygen', 'Carbon dioxide', 'Nitrogen', 'Helium', 'B', 'Carbon dioxide waste diffuses from capillary blood into alveoli for excretion.'),
(119, 12, 'The cardiac notch, accommodating the heart, is located on which lung?', 'Right lung', 'Left lung', 'Both lungs', 'Neither lung', 'B', 'The left lung features the cardiac notch on its medial surface.'),
(120, 12, 'What cell types produce alveolar surfactant?', 'Type I alveolar cells', 'Type II alveolar cells', 'Goblet cells', 'Hepatocytes', 'B', 'Type II alveolar cells secrete surfactant to reduce surface tension.'),

-- TRACHEA (Organ 13)
(121, 13, 'What is the common name for the trachea?', 'Voice box', 'Windpipe', 'Gullet', 'Throat', 'B', 'The trachea is commonly known as the windpipe.'),
(122, 13, 'What structures prevent the trachea from collapsing during inhalation?', 'Bony rings', 'C-shaped hyaline cartilage rings', 'Elastic ligaments', 'Fibrous plates', 'B', 'C-shaped hyaline cartilage rings provide support against negative pressure.'),
(123, 13, 'The trachea lies directly anterior to which organ?', 'Stomach', 'Esophagus', 'Larynx', 'Heart', 'B', 'The trachea runs directly in front of the esophagus.'),
(124, 13, 'What type of epithelial tissue lines the interior of the trachea?', 'Simple squamous', 'Pseudostratified ciliated columnar', 'Stratified cuboidal', 'Transitional', 'B', 'The trachea is lined with pseudostratified ciliated columnar epithelium.'),
(125, 13, 'Which tracheal cells produce sticky mucus to trap foreign particles?', 'Ciliated cells', 'Goblet cells', 'Parietal cells', 'Chief cells', 'B', 'Goblet cells interspersed in the epithelium secrete protective mucus.'),
(126, 13, 'What is the upward sweeping defense mechanism of the trachea called?', 'Peristalsis', 'Mucociliary escalator', 'Biliary flow', 'Segmentation', 'B', 'The mucociliary escalator sweeps trapped particles up to the pharynx.'),
(127, 13, 'The trachea splits at its distal end into what airways?', 'Bronchioles', 'Primary bronchi', 'Alveoli', 'Larynges', 'B', 'The trachea splits into the right and left primary bronchi.'),
(128, 13, 'What type of cartilage composes the tracheal support rings?', 'Elastic cartilage', 'Hyaline cartilage', 'Fibrocartilage', 'Calcified cartilage', 'B', 'The support rings are made of hyaline cartilage.'),
(129, 13, 'What is the internal ridge at the base of the trachea where it bifurcates?', 'Epiglottis', 'Carina', 'Glottis', 'Pharynx', 'B', 'The carina is the sensitive ridge at the tracheal term where it bifurcates.'),
(130, 13, 'Why are the tracheal cartilage rings open posteriorly (C-shaped)?', 'To allow neck twisting', 'To allow the esophagus to expand when swallowing', 'To reduce skeleton weight', 'To accommodate the thymus gland', 'B', 'The posterior opening allows the esophagus to expand during swallowing.'),

-- DIAPHRAGM (Organ 14)
(131, 14, 'What dome-shaped muscle is the primary muscle of breathing?', 'Intercostal muscle', 'Diaphragm', 'Pectoralis minor', 'Rectus abdominis', 'B', 'The diaphragm is the principal skeletal muscle driving respiration.'),
(132, 14, 'Which nerve innervates the diaphragm to trigger contraction?', 'Vagus nerve', 'Phrenic nerve', 'Sciatic nerve', 'Femoral nerve', 'B', 'The phrenic nerve (arising from C3-C5) controls the diaphragm.'),
(133, 14, 'What shape does the diaphragm assume when it is relaxed?', 'Flat sheet', 'Dome', 'Tube', 'V-shape', 'B', 'When relaxed, the diaphragm arches upward to form a dome shape.'),
(134, 14, 'What happens to the diaphragm when it contracts during inhalation?', 'It moves upward', 'It flattens and moves downward', 'It expands laterally', 'It closes completely', 'B', 'Diaphragm contraction flattens the muscle and pulls it downward.'),
(135, 14, 'The diaphragm separates the thoracic cavity from which other cavity?', 'Pleural cavity', 'Abdominal cavity', 'Pelvic cavity', 'Cranial cavity', 'B', 'The diaphragm forms the boundary between the thoracic and abdominal cavities.'),
(136, 14, 'Diaphragm contraction causes the volume of the thoracic cavity to:', 'Decrease', 'Increase', 'Remain unchanged', 'Drop to zero', 'B', 'Contraction expands the thoracic cavity, increasing its volume.'),
(137, 14, 'During inspiration, the increase in thoracic volume causes pressure in the lungs to:', 'Increase', 'Decrease below atmospheric pressure', 'Remain equal', 'Double', 'B', 'Thoracic expansion lowers intrapulmonary pressure, drawing air in.'),
(138, 14, 'During passive exhalation, what action does the diaphragm perform?', 'It contracts harder', 'It relaxes and moves upward', 'It flattens further', 'It rotates downward', 'B', 'Relaxation allows the diaphragm to return upward to its dome shape.'),
(139, 14, 'What type of muscle tissue composes the diaphragm?', 'Smooth muscle', 'Skeletal muscle', 'Cardiac muscle', 'Adipose tissue', 'B', 'The diaphragm is composed of skeletal muscle fibers under voluntary/involuntary nervous control.'),
(140, 14, 'The muscle fibers of the diaphragm insert into what structures?', 'Vertebrae', 'Central tendon', 'Sternum', 'Ribs', 'B', 'Diaphragm muscle fibers insert into its own central tendon.'),

-- STOMACH (Organ 15)
(141, 15, 'What is the general shape of the human stomach?', 'U-shape', 'J-shape', 'S-shape', 'C-shape', 'B', 'The stomach is a J-shaped distensible muscular pouch.'),
(142, 15, 'Which sphincter controls the exit of chyme from the stomach?', 'Cardiac sphincter', 'Pyloric sphincter', 'Ileocecal sphincter', 'Anal sphincter', 'B', 'The pyloric sphincter regulates passage from the stomach to the duodenum.'),
(143, 15, 'What are the folds in the stomach mucosa that allow for expansion called?', 'Villi', 'Rugae', 'Haustra', 'Sutures', 'B', 'Rugae are gastric folds that flatten out as the stomach expands.'),
(144, 15, 'What enzyme is activated in the stomach to digest proteins?', 'Amylase', 'Pepsin', 'Lipase', 'Trypsin', 'B', 'Pepsin is the active gastric protease that digests proteins.'),
(145, 15, 'What highly acidic semi-fluid mixture is formed in the stomach?', 'Bolus', 'Chyme', 'Bile', 'Feces', 'B', 'Stomach churning and chemical digestion produce acidic chyme.'),
(146, 15, 'Which stomach cells secrete hydrochloric acid?', 'Chief cells', 'Parietal cells', 'Goblet cells', 'G cells', 'B', 'Parietal cells secrete hydrochloric acid and intrinsic factor.'),
(147, 15, 'What glycoprotein secreted by the stomach is required for vitamin B12 absorption?', 'Pepsinogen', 'Intrinsic factor', 'Gastrin', 'Mucus', 'B', 'Intrinsic factor is essential for B12 absorption in the ileum.'),
(148, 15, 'How many smooth muscle layers compose the stomach wall?', '2 layers', '3 layers', '4 layers', '1 layer', 'B', 'The stomach has 3 muscle layers (longitudinal, circular, oblique) for churning.'),
(149, 15, 'Which stomach region connects directly to the esophagus?', 'Fundus', 'Cardia', 'Pylorus', 'Body', 'B', 'The cardia is the entry zone surrounding the esophageal opening.'),
(150, 15, 'What substance protects the stomach wall from digesting itself?', 'Hydrochloric acid', 'Alkaline mucus', 'Pepsinogen', 'Saliva', 'B', 'A thick layer of alkaline mucus shields the mucosa from acid/pepsin.'),

-- SMALL INTESTINE (Organ 16)
(151, 16, 'What is the primary site of nutrient absorption in the digestive system?', 'Stomach', 'Small intestine', 'Large intestine', 'Esophagus', 'B', 'Almost all nutrient absorption occurs in the small intestine.'),
(152, 16, 'What is the first and shortest part of the small intestine?', 'Jejunum', 'Duodenum', 'Ileum', 'Cecum', 'B', 'The duodenum is the short, C-shaped initial segment (approx. 25 cm).'),
(153, 16, 'Where is the brush border (microvilli) located?', 'Stomach', 'Small intestine', 'Esophagus', 'Large intestine', 'B', 'Microvilli forming the brush border line the small intestine mucosa.'),
(154, 16, 'What is the longest, final section of the small intestine?', 'Duodenum', 'Jejunum', 'Ileum', 'Colon', 'C', 'The ileum is the final, longest section of the small intestine.'),
(155, 16, 'What valve sits at the junction of the small and large intestines?', 'Pyloric valve', 'Ileocecal valve', 'Cardiac valve', 'Anal valve', 'B', 'The ileocecal valve controls entry into the large intestine.'),
(156, 16, 'What lymphatic vessels inside the villi absorb dietary fats?', 'Capillaries', 'Lacteals', 'Veins', 'Triads', 'B', 'Lacteals absorb lipids packaged into chylomicrons.'),
(157, 16, 'Which fluid, sent to the duodenum, is responsible for emulsifying fats?', 'Saliva', 'Bile', 'Pepsin', 'Amylase', 'B', 'Bile produced by the liver emulsifies large fat droplets into micelles.'),
(158, 16, 'What structures increase the mucosal surface area of the small intestine?', 'Rugae', 'Villi and microvilli', 'Haustra', 'Lobules', 'B', 'Circular folds, villi, and microvilli maximize surface area.'),
(159, 16, 'Which section of the small intestine performs the bulk of nutrient absorption?', 'Duodenum', 'Jejunum', 'Ileum', 'Colon', 'B', 'The jejunum is the primary site for nutrient absorption.'),
(160, 16, 'Pancreatic juices enter the duodenum to neutralize what substance?', 'Saliva', 'Acidic chyme', 'Bile', 'Urea', 'B', 'Alkaline pancreatic bicarbonate neutralizes acidic stomach chyme.'),

-- LARGE INTESTINE (Organ 17)
(161, 17, 'What is the primary absorption role of the large intestine?', 'Fat absorption', 'Water and mineral salt absorption', 'Protein absorption', 'Acid absorption', 'B', 'The large intestine primarily absorbs remaining water and salts.'),
(162, 17, 'What pouch-like structure marks the start of the large intestine?', 'Duodenum', 'Cecum', 'Rectum', 'Sigmoid colon', 'B', 'The cecum is the initial pouch connecting to the ileum.'),
(163, 17, 'Which vestigial lymphoid organ is attached to the cecum?', 'Gallbladder', 'Appendix', 'Spleen', 'Thymus', 'B', 'The appendix is attached to the posteromedial wall of the cecum.'),
(164, 17, 'What are the three ribbon-like muscle bands on the outer colon wall called?', 'Haustra', 'Teniae coli', 'Rugae', 'Villi', 'B', 'Teniae coli are longitudinal muscle bands running the length of the colon.'),
(165, 17, 'What pocket-like sacs characterize the structure of the colon wall?', 'Haustra', 'Lobules', 'Rugae', 'Villi', 'A', 'Haustra are the pocket-like pouches of the colon wall.'),
(166, 17, 'Which vitamin is synthesized by symbiotic gut bacteria in the colon?', 'Vitamin C', 'Vitamin K', 'Vitamin D', 'Vitamin A', 'B', 'Gut microbiota produce vitamin K and certain B vitamins.'),
(167, 17, 'What is the correct anatomical sequence of the colon segments?', 'Transverse, Descending, Ascending, Sigmoid', 'Ascending, Transverse, Descending, Sigmoid', 'Sigmoid, Descending, Transverse, Ascending', 'Descending, Transverse, Ascending, Sigmoid', 'B', 'Feces travel through ascending, transverse, descending, and sigmoid colon.'),
(168, 17, 'What segment stores feces prior to elimination?', 'Cecum', 'Rectum', 'Ascending colon', 'Duodenum', 'B', 'The rectum stores feces until the defecation reflex is triggered.'),
(169, 17, 'The large intestine lacks villi, reflecting its primary lack of:', 'Water absorption', 'Chemical digestion of nutrients', 'Mucus secretion', 'Smooth muscle', 'B', 'Lacking villi indicates it does not absorb organic nutrients.'),
(170, 17, 'What type of strong, sweeping peristaltic contractions occur in the colon to move feces?', 'Segmentation', 'Mass movements', 'Rugae waves', 'Detoxification', 'B', 'Mass movements sweep fecal matter toward the rectum, often after meals.'),

-- LIVER (Organ 18)
(171, 18, 'What is the largest internal organ in the human body?', 'Brain', 'Liver', 'Heart', 'Stomach', 'B', 'The liver is the largest internal organ and gland.'),
(172, 18, 'In which quadrant of the abdominal cavity is the liver located?', 'Lower left', 'Upper right', 'Upper left', 'Lower right', 'B', 'The liver is situated in the upper right quadrant.'),
(173, 18, 'What digestive fluid is synthesized by the liver?', 'Saliva', 'Bile', 'Pepsin', 'Insulin', 'B', 'The liver synthesizes bile, which is stored in the gallbladder.'),
(174, 18, 'What is the microscopic structural and functional unit of the liver?', 'Nephron', 'Lobule', 'Osteon', 'Alveolus', 'B', 'The liver lobule is the functional unit, having a hexagonal shape.'),
(175, 18, 'The portal triad at each corner of a liver lobule contains which blood vessel carrying blood to the central vein?', 'Hepatic portal vein branch', 'Renal artery branch', 'Pulmonary vein branch', 'Jugular vein branch', 'A', 'The portal triad contains a branch of the hepatic portal vein, which carries blood through lobule sinusoids.'),
(176, 18, 'In what form does the liver store carbohydrate reserves?', 'Starch', 'Glycogen', 'Cellulose', 'Glucose', 'B', 'The liver stores excess glucose as the polymer glycogen.'),
(177, 18, 'Which blood plasma protein is synthesized by the liver to regulate blood pressure/osmosis?', 'Hemoglobin', 'Albumin', 'Myoglobin', 'Keratin', 'B', 'Albumin is synthesized by the liver, regulating colloid osmotic pressure.'),
(178, 18, 'Through what blood vessel does the liver receive nutrient-rich blood from the digestive organs?', 'Hepatic artery', 'Hepatic portal vein', 'Central vein', 'Inferior vena cava', 'B', 'The hepatic portal vein routes nutrient-rich blood from stomach/intestines directly to the liver.'),
(179, 18, 'How many structural lobes make up the human liver?', '2 lobes', '4 lobes', '3 lobes', '5 lobes', 'B', 'The liver has 4 lobes: right, left, caudate, and quadrate lobes.'),
(180, 18, 'Where does blood drain in the center of the liver lobule?', 'Portal triad', 'Central vein', 'Bile duct', 'Hepatic artery', 'B', 'Blood flows through sinusoids and drains into the central vein in the lobule center.'),
(181, 19, 'What is the functional microscopic unit of the kidney responsible for urine formation?', 'Nephron', 'Glomerulus', 'Renal pelvis', 'Cortex', 'A', 'The nephron is the functional microscopic unit of the kidney, with each kidney containing about 1 million nephrons.'),
(182, 19, 'In which renal structure does primary blood pressure-driven filtration occur?', 'Loop of Henle', 'Glomerulus', 'Collecting duct', 'Ureter', 'B', 'Glomerular filtration forces water and small solutes across the fenestrated capillaries into Bowman''s capsule.'),
(183, 19, 'Which hormone is secreted by the kidneys to stimulate red blood cell synthesis in bone marrow?', 'Renin', 'Erythropoietin', 'Calcitriol', 'Aldosterone', 'B', 'Erythropoietin (EPO) is secreted by the kidneys in response to cellular hypoxia to stimulate erythropoiesis.'),
(184, 19, 'What enzyme do the kidneys secrete when blood pressure drops to initiate vasoconstriction?', 'Angiotensin II', 'Renin', 'ACE', 'Calcitonin', 'B', 'Renin is secreted by juxtaglomerular cells when blood pressure drops, initiating the renin-angiotensin-aldosterone system.'),
(185, 19, 'Where are the renal pyramids located within the kidney?', 'Renal cortex', 'Renal medulla', 'Renal pelvis', 'Ureter', 'B', 'The renal pyramids are cone-shaped tissue masses located in the inner renal medulla.'),
(186, 19, 'What process returns vital nutrients like glucose and amino acids from filtrate back into the blood?', 'Glomerular filtration', 'Tubular reabsorption', 'Tubular secretion', 'Micturition', 'B', 'Tubular reabsorption reclaims water, glucose, amino acids, and essential ions back into peritubular capillaries.'),
(187, 19, 'Which active hormone form of Vitamin D is synthesized by the kidneys?', 'Cholecalciferol', 'Calcitriol', 'Calcitonin', 'Thyroxine', 'B', 'The kidneys convert precursor Vitamin D into active calcitriol, which increases intestinal calcium absorption.'),
(188, 19, 'What funnels urine from the renal pyramids into the renal pelvis?', 'Minor and major calyces', 'Ureters', 'Glomeruli', 'Collecting tubules', 'A', 'Urine drains from papillae into minor calyces, which merge into major calyces and flow into the renal pelvis.'),
(189, 19, 'What anatomical term describes the location of the kidneys behind the peritoneal cavity?', 'Intraperitoneal', 'Retroperitoneal', 'Pelvic', 'Mediastinal', 'B', 'The kidneys lie retroperitoneally between the posterior abdominal wall and the parietal peritoneum.'),
(190, 19, 'Which renal vessel carries filtered deoxygenated blood away from the kidney to the inferior vena cava?', 'Renal artery', 'Renal vein', 'Afferent arteriole', 'Efferent arteriole', 'B', 'The renal vein collects filtered blood from peritubular capillaries and returns it to the inferior vena cava.'),
(191, 20, 'What is the collective name of the three smooth muscle layers composing the bladder wall?', 'Trigone muscle', 'Detrusor muscle', 'External sphincter', 'Rugae muscle', 'B', 'The detrusor muscle consists of three smooth muscle layers that contract to expel urine during micturition.'),
(192, 20, 'What type of epithelial tissue lines the interior of the bladder, allowing it to stretch?', 'Simple squamous', 'Transitional epithelium', 'Pseudostratified columnar', 'Stratified cuboidal', 'B', 'Transitional epithelium (urothelium) allows the bladder lining to expand as it fills with urine.'),
(193, 20, 'What smooth triangular area at the base of the bladder remains flat during filling?', 'Trigone', 'Fundus', 'Apex', 'Neck', 'A', 'The trigone is a smooth triangular region at the bladder base outlined by the two ureteral openings and urethral exit.'),
(194, 20, 'Which division of the autonomic nervous system triggers detrusor muscle contraction to empty the bladder?', 'Sympathetic', 'Parasympathetic', 'Somatic', 'Enteric', 'B', 'Parasympathetic nerve signals stimulate detrusor contraction and internal sphincter relaxation during micturition.'),
(195, 20, 'Which urethral sphincter is under voluntary somatic nervous control?', 'Internal urethral sphincter', 'External urethral sphincter', 'Detrusor sphincter', 'Trigone sphincter', 'B', 'The external urethral sphincter is composed of skeletal muscle and controlled voluntarily by the pudendal nerve.'),
(196, 20, 'During the bladder storage phase, sympathetic innervation causes the detrusor muscle to:', 'Contract forcefully', 'Relax to accommodate volume', 'Spasm rapidly', 'Shed its mucosa', 'B', 'Sympathetic signals relax the detrusor muscle and contract the internal sphincter to allow low-pressure urine storage.'),
(197, 20, 'What mucosal folds flatten as the urinary bladder fills with urine?', 'Villi', 'Rugae', 'Haustra', 'Microvilli', 'B', 'Rugae are mucosal folds that unpleat and flatten out as the bladder expands.'),
(198, 20, 'Where is the spinal reflex center for micturition located?', 'Cervical spinal cord', 'Sacral spinal cord', 'Brainstem medulla', 'Lumbar cortex', 'B', 'Afferent stretch signals trigger the involuntary micturition reflex arc in the sacral segments (S2-S4) of the spinal cord.'),
(199, 20, 'What is the physiological term for the act of emptying the urinary bladder?', 'Peristalsis', 'Micturition', 'Deglutition', 'Segmentation', 'B', 'Micturition is the medical term for urination.'),
(200, 20, 'What typical fluid volume in the bladder triggers the initial urge to urinate?', '50 mL', '150-300 mL', '800-1000 mL', '50-100 mL', 'B', 'Stretch receptors trigger sensory awareness and the initial urge to void when bladder volume reaches 150-300 mL.'),
(201, 21, 'How do the ureters actively move urine from the kidneys to the bladder?', 'Gravitational drainage', 'Peristaltic contractions', 'Ciliary sweeping', 'Suction pressure', 'B', 'Smooth muscle in the ureter walls generates rhythmic peristaltic waves to propel urine forward.'),
(202, 21, 'What epithelial tissue lines the lumen of the ureters?', 'Transitional epithelium', 'Simple columnar', 'Stratified squamous', 'Pseudostratified ciliated', 'A', 'Transitional epithelium lines the ureter lumen to accommodate stretching and resist urine acidity.'),
(203, 21, 'Where do pacemaker cells that initiate ureteral peristalsis reside?', 'Renal pelvis', 'Bladder trigone', 'Adrenal cortex', 'Urethra', 'A', 'Pacemaker cells in the smooth muscle of the renal pelvis generate rhythmic electrical impulses for peristalsis.'),
(204, 21, 'At what anatomical angle do the ureters enter the posterior wall of the bladder?', 'Perpendicular', 'Oblique angle', 'Parallel', 'Vertical', 'B', 'The ureters enter the bladder obliquely, creating a functional valve that closes under internal pressure to prevent reflux.'),
(205, 21, 'What medical term describes the pathological backflow of urine from the bladder into the ureters?', 'Vesicoureteral reflux', 'Micturition', 'Glomerulonephritis', 'Pyelonephritis', 'A', 'Vesicoureteral reflux is the backward flow of urine into the ureters when the entry valve fails.'),
(206, 21, 'How many smooth muscle layers compose the muscularis wall of the ureter?', '1 layer', '2 layers', '3 layers', '4 layers', 'B', 'The muscularis has an inner longitudinal layer and outer circular layer of smooth muscle (with a 3rd layer near the bladder).'),
(207, 21, 'What is the average length of an adult human ureter?', '5-10 cm', '25-30 cm', '50-60 cm', '100 cm', 'B', 'Adult ureters measure approximately 25 to 30 cm (10 to 12 inches) in length.'),
(208, 21, 'What fibrous connective tissue layer anchors the outer surface of the ureter?', 'Serosa', 'Adventitia', 'Epidermis', 'Pericardium', 'B', 'The adventitia is the fibrous outer layer that anchors the ureter to retroperitoneal structures.'),
(209, 21, 'How frequently do peristaltic waves typically travel down the ureters?', 'Every 10-30 seconds', 'Once per hour', 'Every 5 minutes', 'Continuous steady flow', 'A', 'Peristaltic waves pulse down the ureters at intervals ranging from 10 to 30 seconds.'),
(210, 21, 'Solid crystalline mineral deposits formed in the renal pelvis that can block the ureters are called:', 'Gallstones', 'Kidney stones (renal calculi)', 'Tonsilloliths', 'Plaques', 'B', 'Renal calculi (kidney stones) can lodge in the narrow ureters, causing severe peristaltic spasms and pain.'),
(211, 22, 'In which depression of the sphenoid bone is the pituitary gland protected?', 'Foramen magnum', 'Sella turcica', 'Cribriform plate', 'Acetabulum', 'B', 'The pituitary gland sits safely protected in the sella turcica depression of the sphenoid bone.'),
(212, 22, 'What structure connects the pituitary gland directly to the hypothalamus?', 'Infundibulum', 'Corpus callosum', 'Thalamus', 'Pons', 'A', 'The infundibulum (pituitary stalk) connects the pituitary gland to the hypothalamus.'),
(213, 22, 'Which lobe of the pituitary gland is composed of neural tissue extending from hypothalamic axons?', 'Anterior pituitary', 'Posterior pituitary', 'Intermediate lobe', 'Thyroid lobe', 'B', 'The posterior pituitary (neurohypophysis) consists of nerve terminals extending directly from hypothalamic neurons.'),
(214, 22, 'Which anterior pituitary hormone stimulates cortisol secretion from the adrenal cortex?', 'TSH', 'ACTH', 'FSH', 'Prolactin', 'B', 'Adrenocorticotropic hormone (ACTH) stimulates the middle zone of the adrenal cortex to produce cortisol.'),
(215, 22, 'Which posterior pituitary hormone promotes renal water reabsorption to raise blood volume?', 'Oxytocin', 'Antidiuretic Hormone (ADH)', 'Growth Hormone', 'Calcitonin', 'B', 'ADH (vasopressin) increases water permeability in kidney collecting ducts to conserve body water.'),
(216, 22, 'What hypothalamic hormones regulate the release of anterior pituitary secretions?', 'Steroids', 'Releasing and inhibiting hormones', 'Neurotransmitters', 'Biliary salts', 'B', 'Hypothalamic releasing and inhibiting hormones travel through the hypophyseal portal system to control the anterior lobe.'),
(217, 22, 'Which anterior pituitary hormone stimulates milk synthesis in female mammary glands?', 'Oxytocin', 'Prolactin', 'Luteinizing hormone', 'Thyrotropin', 'B', 'Prolactin (PRL) stimulates the synthesis of milk in mammary glands.'),
(218, 22, 'Which hormone stored in the posterior pituitary triggers uterine labor contractions?', 'Estrogen', 'Oxytocin', 'Progesterone', 'FSH', 'B', 'Oxytocin stimulates smooth muscle contractions of the myometrium during labor and milk ejection during nursing.'),
(219, 22, 'Gigantism and acromegaly result from hypersecretion of which pituitary hormone?', 'Thyroid-stimulating hormone', 'Growth hormone (GH)', 'ACTH', 'Prolactin', 'B', 'Hypersecretion of Growth Hormone (GH) leads to gigantism in children and acromegaly in adults.'),
(220, 22, 'Which anterior pituitary hormones are collectively termed gonadotropins because they target the gonads?', 'FSH and LH', 'GH and TSH', 'ACTH and PRL', 'ADH and Oxytocin', 'A', 'Follicle-stimulating hormone (FSH) and Luteinizing hormone (LH) target ovaries and testes, so they are gonadotropins.'),
(221, 23, 'What micro-structural spherical units compose the glandular tissue of the thyroid?', 'Thyroid follicles', 'Islets of Langerhans', 'Lobules', 'Nephrons', 'A', 'The thyroid is composed of thousands of spherical thyroid follicles lined by follicular cells.'),
(222, 23, 'Which essential dietary trace mineral is required to synthesize T3 and T4 thyroid hormones?', 'Calcium', 'Iodine', 'Iron', 'Zinc', 'B', 'Iodine is absorbed from food and actively trapped by follicular cells to produce T3 and T4.'),
(223, 23, 'What proteinaceous gel fills the center of thyroid follicles as a hormone storage reservoir?', 'Mucus', 'Colloid', 'Bile', 'Lymph', 'B', 'Colloid is the viscous gel inside follicles where thyroglobulin precursor is stored.'),
(224, 23, 'What hormone produced by thyroid C-cells lowers elevated blood calcium levels?', 'Parathyroid hormone', 'Calcitonin', 'Aldosterone', 'Thyroxine', 'B', 'Calcitonin is secreted by parafollicular C-cells to inhibit osteoclast activity and lower blood calcium.'),
(225, 23, 'What primary metabolic rate effect do T3 and T4 hormones exert on target body cells?', 'Decrease metabolic rate', 'Increase basal metabolic rate (BMR)', 'Halt ATP production', 'Promote sleep', 'B', 'T3 and T4 stimulate cellular respiration, increasing basal metabolic rate, oxygen consumption, and heat generation.'),
(226, 23, 'What narrow tissue bridge connects the right and left lobes of the thyroid gland across the trachea?', 'Infundibulum', 'Isthmus', 'Carina', 'Artery', 'B', 'The isthmus is the narrow central tissue band bridging the two lateral lobes of the thyroid.'),
(227, 23, 'An enlargement of the thyroid gland caused by iodine deficiency or hormone dysregulation is called a:', 'Goiter', 'Polyp', 'Adenoid', 'Cyst', 'A', 'A goiter is a visible swelling of the thyroid gland, often resulting from dietary iodine deficiency.'),
(228, 23, 'Which is the more potent, biologically active form of thyroid hormone at the cell receptor level?', 'T4 (Thyroxine)', 'T3 (Triiodothyronine)', 'TSH', 'Calcitonin', 'B', 'T3 is about four times more potent than T4, and target tissues convert T4 into T3.'),
(229, 23, 'Which pituitary hormone controls the synthesis and secretion of T3 and T4?', 'ACTH', 'Thyroid-Stimulating Hormone (TSH)', 'FSH', 'GH', 'B', 'TSH (thyrotropin) from the anterior pituitary stimulates thyroid hormone synthesis and release.'),
(230, 23, 'Hypothyroidism present from birth that leads to intellectual disability and stunted growth is called:', 'Graves disease', 'Congenital hypothyroidism (Cretinism)', 'Cushing syndrome', 'Addison disease', 'B', 'Congenital hypothyroidism (cretinism) results from severe lack of thyroid hormone during fetal and infant development.'),
(231, 24, 'Where are the paired adrenal glands located in the human body?', 'Superior pole of each kidney', 'Anterior neck', 'Base of brain', 'Posterior mediastinum', 'A', 'The adrenal (suprarenal) glands rest atop the superior pole of each kidney.'),
(232, 24, 'Which zone of the adrenal cortex secretes aldosterone to regulate sodium and potassium balance?', 'Zona fasciculata', 'Zona glomerulosa', 'Zona reticularis', 'Adrenal medulla', 'B', 'The outer zona glomerulosa secretes aldosterone, a mineralocorticoid that regulates sodium and potassium.'),
(233, 24, 'Which middle zone of the adrenal cortex secretes cortisol in response to stress and ACTH?', 'Zona glomerulosa', 'Zona fasciculata', 'Zona reticularis', 'Adrenal medulla', 'B', 'The middle zona fasciculata secretes cortisol (glucocorticoid) to mobilize energy stores during stress.'),
(234, 24, 'What specialized neuroendocrine cells in the adrenal medulla synthesize epinephrine and norepinephrine?', 'Chromaffin cells', 'Chief cells', 'Parietal cells', 'Follicular cells', 'A', 'Chromaffin cells in the adrenal medulla are modified postganglionic sympathetic neurons that secrete catecholamines.'),
(235, 24, 'What ratio of Epinephrine to Norepinephrine is secreted by the adrenal medulla during sympathetic stimulation?', '80% Epinephrine / 20% Norepinephrine', '50% / 50%', '10% Epinephrine / 90% Norepinephrine', '100% Norepinephrine', 'A', 'The adrenal medulla secretes approximately 80% Epinephrine (adrenaline) and 20% Norepinephrine (noradrenaline).'),
(236, 24, 'Which mineralocorticoid hormone increases renal tubular reabsorption of sodium and excretion of potassium?', 'Cortisol', 'Aldosterone', 'DHEA', 'Epinephrine', 'B', 'Aldosterone acts on distal tubules to save sodium and water while excreting potassium, raising blood pressure.'),
(237, 24, 'Hypersecretion of cortisol by the adrenal cortex leads to which endocrine disorder?', 'Addison disease', 'Cushing syndrome', 'Diabetes mellitus', 'Goiter', 'B', 'Cushing syndrome is caused by excess glucocorticoid (cortisol) levels, leading to hyperglycemia and tissue breakdown.'),
(238, 24, 'Hyposecretion of adrenal cortical steroid hormones (aldosterone and cortisol) causes:', 'Graves disease', 'Addison disease', 'Cushing syndrome', 'Acromegaly', 'B', 'Addison disease is characterized by autoimmune destruction of the adrenal cortex, causing low blood pressure and hypoglycemia.'),
(239, 24, 'Which functional metabolic effect does cortisol exert during prolonged stress?', 'Lower blood sugar', 'Promote gluconeogenesis and elevate blood glucose', 'Build muscle mass', 'Decrease heart rate', 'B', 'Cortisol stimulates gluconeogenesis in the liver and breaks down fats/proteins to supply elevated blood glucose.'),
(240, 24, 'Which inner zone of the adrenal cortex produces weak sex steroids (adrenal androgens)?', 'Zona glomerulosa', 'Zona fasciculata', 'Zona reticularis', 'Adrenal medulla', 'C', 'The inner zona reticularis secretes weak androgens such as dehydroepiandrosterone (DHEA).'),
(241, 25, 'What is the outermost avascular layer of the skin composed of keratinized stratified squamous epithelium?', 'Dermis', 'Epidermis', 'Hypodermis', 'Fascia', 'B', 'The epidermis is the outermost avascular layer composed of stratified squamous keratinized epithelium.'),
(242, 25, 'Which predominant epidermal cells produce the tough fibrous protein keratin?', 'Melanocytes', 'Keratinocytes', 'Langerhans cells', 'Merkel cells', 'B', 'Keratinocytes constitute 90% of epidermal cells and produce protective keratin.'),
(243, 25, 'Which cells located in the basal epidermis synthesize the protective pigment melanin?', 'Keratinocytes', 'Melanocytes', 'Langerhans cells', 'Fibroblasts', 'B', 'Melanocytes produce melanin, which transfers to keratinocytes to shield nuclei from solar UV radiation.'),
(244, 25, 'Which layer of the epidermis consists of dead, flattened keratinised scale-like cells that shed continuously?', 'Stratum basale', 'Stratum corneum', 'Stratum spinosum', 'Stratum granulosum', 'B', 'The stratum corneum is the outermost epidermal layer composed of 20-30 rows of dead keratinized squames.'),
(245, 25, 'What dendritic immune cells in the epidermis trap foreign antigens and present them to lymphocytes?', 'Langerhans cells', 'Merkel cells', 'Chief cells', 'Adipocytes', 'A', 'Langerhans cells are intraepidermal macrophages that participate in cutaneous immune surveillance.'),
(246, 25, 'What connective tissue layer beneath the epidermis houses blood vessels, nerves, and sweat glands?', 'Epidermis', 'Dermis', 'Cuticle', 'Stratum corneum', 'B', 'The dermis is the vascular connective tissue layer beneath the epidermis housing nerves, glands, and hair follicles.'),
(247, 25, 'How does the skin regulate body temperature when overheated?', 'Vasoconstriction and shivering', 'Cutaneous vasodilation and eccrine sweating', 'Arrector pili contraction', 'Melanin release', 'B', 'Dermal blood vessels dilate (vasodilation) and eccrine sweat glands produce sweat for evaporative cooling.'),
(248, 25, 'Which precursor molecule in skin keratinocytes is converted into Vitamin D3 by sunlight?', 'Thyroglobulin', '7-Dehydrocholesterol', 'Melanin', 'Keratin', 'B', '7-Dehydrocholesterol in basal skin cells is converted into cholecalciferol (Vitamin D3) by solar UVB light.'),
(249, 25, 'What deep subcutaneous layer composed of adipose and loose connective tissue anchors skin to muscle?', 'Dermis', 'Hypodermis (Subcutis)', 'Stratum basale', 'Eponychium', 'B', 'The hypodermis (subcutis) contains adipose tissue that provides insulation, cushioning, and skin anchorage.'),
(250, 25, 'Which tactile mechanoreceptors in the basal epidermis respond to light touch and pressure?', 'Merkel cells', 'Melanocytes', 'Goblet cells', 'Langerhans cells', 'A', 'Merkel (tactile) cells in the stratum basale communicate with nerve endings to detect fine touch.'),
(251, 26, 'From what anatomical structure dipping down into the dermis does each hair originate?', 'Nail matrix', 'Hair follicle', 'Eccrine gland', 'Sebaceous duct', 'B', 'Each hair originates from a tubular invagination of the epidermis into the dermis called a hair follicle.'),
(252, 26, 'What smooth muscle bundle attached to a hair follicle contracts to produce "goosebumps"?', 'Arrector pili muscle', 'Detrusor muscle', 'Trachealis muscle', 'Orbicularis muscle', 'A', 'The arrector pili muscle contracts under sympathetic stimulation, pulling hair upright and puckering skin.'),
(253, 26, 'What expanded base of the hair root contains proliferating matrix cells and blood capillaries?', 'Hair shaft', 'Hair bulb', 'Cuticle', 'Arrector muscle', 'B', 'The hair bulb is the enlarged lower extremity of the root housing the vascular papilla and dividing matrix cells.'),
(254, 26, 'Which active growth phase of the hair cycle lasts 2 to 7 years for human scalp hair?', 'Anagen', 'Catagen', 'Telogen', 'Exogen', 'A', 'Anagen is the active growth phase during which matrix cells divide rapidly to lengthen the hair shaft.'),
(255, 26, 'What resting phase of the hair growth cycle lasts 1 to 4 months before old hair falls out?', 'Anagen', 'Catagen', 'Telogen', 'Mitotic phase', 'C', 'Telogen is the resting phase after which the old club hair is shed as a new shaft begins growing.'),
(256, 26, 'What nerve plexus wrapped around the base of a hair follicle detects hair movement?', 'Root hair plexus (Hair follicle receptor)', 'Meissner corpuscle', 'Pacini corpuscle', 'Autonomic ganglion', 'A', 'The root hair plexus consists of sensory nerve endings wrapped around the follicle that sense shaft movement.'),
(257, 26, 'What glands open into hair follicles to secrete an oily substance called sebum?', 'Eccrine sweat glands', 'Sebaceous glands', 'Ceruminous glands', 'Mammary glands', 'B', 'Sebaceous glands secrete sebum, an oily lipid mixture that lubricates hair shafts and conditions the skin.'),
(258, 26, 'What hard protein composes the dead cells of the hair shaft?', 'Collagen', 'Keratin', 'Elastin', 'Fibrin', 'B', 'Hair is composed of heavily keratinized, tightly packed dead epithelial cells.'),
(259, 26, 'What central layer of a hair shaft contains pigment granules produced by melanocytes?', 'Cuticle', 'Cortex', 'Medulla', 'Matrix', 'B', 'The middle cortex layer contains melanin granules that determine natural hair color.'),
(260, 26, 'Which short regressive phase of the hair cycle involves follicle involution?', 'Anagen', 'Catagen', 'Telogen', 'Synthesis phase', 'B', 'Catagen is the brief transition phase (2-3 weeks) where hair matrix cells stop dividing and the follicle shrinks.'),
(261, 27, 'What hard visible plate of packed dead keratinized cells forms the main body of a nail?', 'Nail matrix', 'Nail plate (body)', 'Nail bed', 'Eponychium', 'B', 'The nail plate is the hard, visible exterior structure covering the dorsal distal phalanx.'),
(262, 27, 'Where does active cell division and nail plate growth occur beneath the proximal fold?', 'Nail matrix', 'Hyponychium', 'Lunula', 'Nail bed', 'A', 'The nail matrix contains dividing stem cells that produce the keratinized cells of the nail plate.'),
(263, 27, 'What is the medical name for the cuticle fold of stratum corneum over the proximal nail edge?', 'Hyponychium', 'Eponychium', 'Lunula', 'Perionychium', 'B', 'The eponychium (cuticle) is the stratum corneum fold sealing the space between proximal skin and nail plate.'),
(264, 27, 'What crescent-shaped white area at the base of the nail plate overlies the thick nail matrix?', 'Lunula', 'Cuticle', 'Nail bed', 'Sinus', 'A', 'The lunula is the opaque white crescent at the nail base caused by the underlying thick matrix.'),
(265, 27, 'What vascular layer of epidermal tissue lies directly beneath the hard nail plate?', 'Dermis', 'Nail bed', 'Subcutis', 'Matrix', 'B', 'The nail bed is the vascular epithelial layer beneath the nail plate extending from matrix to hyponychium.'),
(266, 27, 'What thickened stratum corneum region beneath the free distal edge of the nail secures it to the fingertip?', 'Eponychium', 'Hyponychium', 'Lunula', 'Matrix', 'B', 'The hyponychium is the protective skin region under the free edge of the nail.'),
(267, 27, 'What primary biological macromolecule makes up the rigid structure of nails?', 'Collagen', 'Hard Keratin', 'Elastin', 'Chitin', 'B', 'Nails are composed of densely compacted dead cells filled with hard alpha-keratin.'),
(268, 27, 'What is the average growth rate of human fingernails per month?', '0.1 mm', '3 mm', '25 mm', '10 mm', 'B', 'Fingernails grow continuously at an average rate of about 3 millimeters per month.'),
(269, 27, 'How do nails enhance tactile perception when holding small objects?', 'By secreting oil', 'By providing a rigid counterforce against the digital pulp', 'By vibrating', 'By absorbing moisture', 'B', 'The rigid nail plate provides a backing counterforce when squeezing objects, enhancing tactile pulp sensitivity.'),
(270, 27, 'Why do toenails typically grow slower than fingernails?', 'They have no matrix', 'Lower regional blood supply and mechanical friction', 'They lack keratin', 'They are non-living', 'B', 'Toenails grow at about 1 mm per month, slower than fingernails due to reduced peripheral circulation and metabolic activity.'),
(271, 28, 'In which quadrant of the abdominal cavity is the spleen located?', 'Lower right quadrant', 'Upper left quadrant', 'Upper right quadrant', 'Lower left quadrant', 'B', 'The spleen is located in the upper left quadrant (left hypochondriac region) of the abdomen.'),
(272, 28, 'Which functional region of splenic tissue filters worn-out red blood cells and stores platelets?', 'White pulp', 'Red pulp', 'Cortical sinus', 'Medulla', 'B', 'The red pulp consists of venous sinusoids and cords where old RBCs are culled and platelets are stored.'),
(273, 28, 'Which functional region of splenic tissue consists of lymphoid aggregates that monitor blood-borne antigens?', 'Red pulp', 'White pulp', 'Renal pelvis', 'Germinal sinus', 'B', 'The white pulp contains lymphocytes organized around central arteries to mount immune responses against blood antigens.'),
(274, 28, 'What is the average physiological lifespan of a human red blood cell before it is culled by the spleen?', '10 days', '120 days', '365 days', '30 days', 'B', 'Circulating erythrocytes live approximately 120 days before their membranes stiffen and they are destroyed by splenic macrophages.'),
(275, 28, 'What recycled component of broken-down hemoglobin is saved by splenic macrophages?', 'Bilirubin', 'Iron (heme iron)', 'Carbon monoxide', 'Glucose', 'B', 'Macrophages salvage iron from degraded heme and transfer it to transferrin for reuse in new red blood cell synthesis.'),
(276, 28, 'What percentage of the body''s blood platelets are stored in the red pulp reservoir of the spleen?', '5%', '30%', '80%', '100%', 'B', 'The spleen''s red pulp acts as a blood reservoir, storing up to 30% of total circulating blood platelets.'),
(277, 28, 'What fibrous connective tissue wrapper encloses the spleen and extends inward as structural beams?', 'Pericardium', 'Capsule and trabeculae', 'Meninges', 'Pleura', 'B', 'A dense fibrous capsule surrounds the spleen, giving off trabeculae that support the internal parenchyma.'),
(278, 28, 'What phagocytic immune cells in the red pulp phagocytose senescent red blood cells?', 'Neutrophils', 'Macrophages', 'Basophils', 'Eosinophils', 'B', 'Splenic macrophages residing in the cords of Billroth engulf old, damaged, or abnormal blood cells.'),
(279, 28, 'Surgical removal of the spleen due to traumatic rupture is known as a:', 'Appendectomy', 'Splenectomy', 'Nephrectomy', 'Lobectomy', 'B', 'A splenectomy is the surgical excision of the spleen.'),
(280, 28, 'Patients who have undergone a splenectomy face an increased risk of severe infections from:', 'Encapsulated blood-borne bacteria', 'Skin fungi', 'Intestinal worms', 'Prions', 'A', 'Without a spleen, individuals have impaired immune clearance of encapsulated blood-borne bacteria (e.g. Streptococcus pneumoniae).'),
(281, 29, 'What vessel type brings raw, unfiltered interstitial lymph into a lymph node?', 'Efferent lymphatic vessel', 'Afferent lymphatic vessel', 'Hepatic vein', 'High endothelial venule', 'B', 'Afferent lymphatic vessels enter the convex border of a lymph node to deliver unfiltered lymph.'),
(282, 29, 'Through what single indentation on a lymph node do efferent vessels and blood vessels exit?', 'Isthmus', 'Hilum', 'Carina', 'Trigone', 'B', 'The hilum is the concave indentation where efferent lymphatic vessels leave and blood vessels enter/exit.'),
(283, 29, 'Which outer cortical structures in lymph nodes harbor dense clusters of proliferating B-lymphocytes?', 'Germinal centers of lymphatic nodules', 'Hassall corpuscles', 'Red pulp cords', 'Medullary sinuses', 'A', 'Germinal centers within cortical nodules are the sites where activated B-cells proliferate and differentiate.'),
(284, 29, 'Which region of the lymph node is populated predominantly by T-lymphocytes?', 'Outer cortex', 'Paracortex (deep cortex)', 'Subcapsular sinus', 'Medullary cord', 'B', 'The paracortex (T-cell zone) contains T-lymphocytes and high endothelial venules.'),
(285, 29, 'What phagocytic immune cells line the cortical and medullary sinuses to engulf passing debris?', 'Keratinocytes', 'Macrophages', 'Red blood cells', 'Platelets', 'B', 'Macrophages lining the lymph node sinuses ingest bacteria, cellular debris, and foreign particles.'),
(286, 29, 'What blood vessels in the paracortex allow circulating lymphocytes to enter lymph node tissue directly?', 'Capillary beds', 'High Endothelial Venules (HEVs)', 'Afferent lymphatic vessels', 'Sinusoids', 'B', 'High Endothelial Venules (HEVs) are specialized venules in the paracortex that enable lymphocytes to migrate into the node.'),
(287, 29, 'Swollen, tender lymph nodes occurring during an active infection are clinically termed:', 'Lymphadenopathy (lymphadenitis)', 'Lymphedema', 'Splenomegaly', 'Atherosclerosis', 'A', 'Lymphadenopathy (lymphadenitis) refers to enlarged, inflamed lymph nodes responding to infection.'),
(288, 29, 'What fluid is filtered by lymph nodes before it returns to systemic venous circulation?', 'Blood plasma', 'Interstitial Lymph', 'Bile', 'Cerebrospinal fluid', 'B', 'Lymph nodes filter lymph fluid drained from interstitial spaces throughout the body.'),
(289, 29, 'What cell types in lymph node medullary cords actively secrete soluble antibodies into lymph?', 'Naïve T-cells', 'Plasma cells', 'Erythrocytes', 'Fibroblasts', 'B', 'Plasma cells (differentiated B-cells) reside in medullary cords and secrete antibodies.'),
(290, 29, 'Into which large lymphatic duct does lymph from the lower body and left upper body drain before joining blood?', 'Right lymphatic duct', 'Thoracic duct', 'Aorta', 'Superior vena cava', 'B', 'The thoracic duct collects lymph from about three-quarters of the body and empties into the left subclavian vein.'),
(291, 30, 'Where is the bi-lobed thymus gland located in the human body?', 'Pelvic cavity', 'Anterior mediastinum behind sternum', 'Retroperitoneum', 'Cranial cavity', 'B', 'The thymus sits in the anterior superior mediastinum directly behind the sternum and in front of the heart.'),
(292, 30, 'What primary immunological role does the thymus play in the lymphatic system?', 'B-cell antibody production', 'T-lymphocyte maturation and education', 'Platelet storage', 'Red blood cell destruction', 'B', 'The thymus provides the essential microenvironment for immature thymocytes to differentiate into mature functional T-cells.'),
(293, 30, 'What term describes the post-pubertal atrophy and fatty replacement of the thymus gland?', 'Micturition', 'Involution', 'Phagocytosis', 'Calorigenesis', 'B', 'Thymic involution is the physiological shrinking and fatty degeneration of the thymus that accelerates after puberty.'),
(294, 30, 'Where within a thymic lobule does positive selection of developing T-cells occur?', 'Thymic cortex', 'Thymic medulla', 'Hassall corpuscle', 'Capsule', 'A', 'Positive selection occurs in the thymic cortex, testing whether immature T-cells can bind to self-MHC complexes.'),
(295, 30, 'Where within the thymus does negative selection eliminate self-reactive T-cells to prevent autoimmunity?', 'Thymic cortex', 'Thymic medulla', 'Subcapsular sinus', 'Afferent vessel', 'B', 'Negative selection takes place in the thymic medulla, where T-cells that react strongly against self-antigens undergo apoptosis.'),
(296, 30, 'What percentage of developing thymocytes survive both positive and negative selection to enter circulation?', '95%', '2-5%', '50%', '75%', 'B', 'Over 95% of developing thymocytes fail selection and undergo apoptosis; only 2-5% mature into naïve T-cells.'),
(297, 30, 'What concentric epithelial structures characteristic of the thymic medulla secrete regulatory cytokines?', 'Hassall corpuscles (Thymic corpuscles)', 'Glomeruli', 'Germinal centers', 'Crypts', 'A', 'Hassall (thymic) corpuscles are unique epithelial cell whorls in the medulla involved in dendritic cell education.'),
(298, 30, 'Which peptide hormone family secreted by thymic stromal cells promotes T-cell competency?', 'Thyroxine', 'Thymosins', 'Calcitonin', 'Aldosterone', 'B', 'Thymosins (including thymopoietin and thymulin) are hormones that stimulate T-cell differentiation and development.'),
(299, 30, 'Which precursor cells migrate from the bone marrow to the thymus to become T-lymphocytes?', 'Progenitor Thymocytes', 'Platelets', 'Monocytes', 'Basophils', 'A', 'Lymphoid progenitor cells formed in the red bone marrow travel via blood to the thymic cortex as thymocytes.'),
(300, 30, 'Failure of negative selection in the thymus increases the clinical risk of:', 'Hemostatic clotting', 'Autoimmune diseases', 'Vitamin deficiency', 'Kidney stones', 'B', 'If self-reactive T-cells escape negative selection in the thymus, they can attack body tissues, causing autoimmune diseases.'),
(301, 31, 'What primary female gametes are produced within the cortex of the ovaries?', 'Spermatozoa', 'Oocytes (ova)', 'Zygotes', 'Polar bodies', 'B', 'The ovaries produce female gametes (oocytes or eggs) through the process of oogenesis.'),
(302, 31, 'Which two primary steroid sex hormones are synthesized and secreted by the ovaries?', 'Testosterone and Cortisol', 'Estrogen and Progesterone', 'Insulin and Glucagon', 'T3 and T4', 'B', 'The ovaries secrete estrogen (drives follicular phase and secondary traits) and progesterone (maintains secretory uterine lining).'),
(303, 31, 'What surge of pituitary hormone triggers mid-cycle follicle rupture and ovulation?', 'FSH surge', 'LH (Luteinizing Hormone) surge', 'ACTH surge', 'Prolactin surge', 'B', 'A sharp surge in Luteinizing Hormone (LH) from the anterior pituitary triggers the rupture of the Graafian follicle and ovulation.'),
(304, 31, 'What endocrine structure forms from the ruptured ovarian follicle after ovulation to secrete progesterone?', 'Corpus albicans', 'Corpus luteum', 'Graafian follicle', 'Primordial follicle', 'B', 'The ruptured follicle remodels into the corpus luteum, secreting high levels of progesterone during the luteal phase.'),
(305, 31, 'What mature fluid-filled ovarian follicle is ready to release its egg at ovulation?', 'Primordial follicle', 'Graafian (tertiary) follicle', 'Corpus albicans', 'Atretic follicle', 'B', 'A Graafian (vesicular) follicle is the fully mature follicle that ruptures during ovulation.'),
(306, 31, 'Where does fertilization of the released oocyte by a sperm cell normally take place?', 'Ovary cortex', 'Fallopian tube (Uterine tube)', 'Uterine cavity', 'Vagina', 'B', 'Fertilization typically occurs in the ampulla of the fallopian tube (uterine tube).'),
(307, 31, 'Which ovarian hormone stimulates the proliferative phase repair of the uterine endometrial lining?', 'Progesterone', 'Estrogen (Estradiol)', 'LH', 'Oxytocin', 'B', 'Estrogen secreted by growing ovarian follicles stimulates endometrial cell proliferation during the first half of the cycle.'),
(308, 31, 'What non-functional scar tissue forms when the corpus luteum degenerates at the end of an unfertilized cycle?', 'Corpus luteum', 'Corpus albicans', 'Graafian follicle', 'Stroma', 'B', 'If fertilization does not occur, the corpus luteum regresses into an inactive fibrous scar called the corpus albicans.'),
(309, 31, 'Which pituitary gonadotropin hormone stimulates the growth of primordial follicles in the ovary cortex?', 'Luteinizing hormone', 'Follicle-Stimulating Hormone (FSH)', 'TSH', 'Prolactin', 'B', 'FSH from the anterior pituitary initiates the growth and maturation of ovarian follicles.'),
(310, 31, 'At what stage of cell division are primary oocytes arrested in the ovaries from birth until puberty?', 'Metaphase II', 'Prophase I of Meiosis', 'Anaphase I', 'Telophase II', 'B', 'Primary oocytes form before birth and remain arrested in Prophase I of meiosis until activated at puberty.'),
(311, 32, 'In what coiled microscopic tubules inside the testes does spermatogenesis take place?', 'Epididymis', 'Seminiferous tubules', 'Vas deferens', 'Ejaculatory ducts', 'B', 'Spermatogenesis occurs within the walls of highly coiled seminiferous tubules in the testicles.'),
(312, 32, 'Which endocrine cells located between seminiferous tubules synthesize testosterone?', 'Sertoli cells', 'Interstitial Leydig cells', 'Chromaffin cells', 'Spermatogonia', 'B', 'Leydig (interstitial) cells located in connective tissue between tubules synthesize testosterone in response to LH.'),
(313, 32, 'Why are the human testes housed outside the abdominal cavity within the scrotum?', 'To increase muscle size', 'Spermatogenesis requires a temperature 2-3°C cooler than core body heat', 'To protect them from acid', 'To store extra blood', 'B', 'Viable sperm production requires a temperature about 2-3°C below internal core body temperature.'),
(314, 32, 'Which large nurse cells in seminiferous tubules nourish developing sperm and form the blood-testis barrier?', 'Leydig cells', 'Sertoli (sustentacular) cells', 'Chief cells', 'G-cells', 'B', 'Sertoli cells form tight junctions creating the blood-testis barrier, supporting and nourishing maturing spermatids.'),
(315, 32, 'Which anterior pituitary hormone stimulates interstitial Leydig cells to produce testosterone?', 'FSH', 'Luteinizing Hormone (LH)', 'Prolactin', 'ACTH', 'B', 'LH (also known as interstitial cell-stimulating hormone) stimulates Leydig cells to produce testosterone.'),
(316, 32, 'What cap-like organelle containing digestive enzymes covers the head of a mature sperm cell?', 'Flagellum', 'Acrosome', 'Centriole', 'Mitochondrial sheath', 'B', 'The acrosome covers the sperm nucleus and contains lysosomal enzymes needed to penetrate the oocyte protective layers.'),
(317, 32, 'Which muscle in the scrotum contracts to pull the testes closer to the body when exposed to cold?', 'Cremaster muscle (and Dartos)', 'Detrusor muscle', 'Arrector pili', 'Psoas muscle', 'A', 'The cremaster and dartos muscles contract when cold to elevate the testes toward body warmth.'),
(318, 32, 'Where are sperm cells stored after leaving seminiferous tubules to complete structural maturation and motility?', 'Prostate gland', 'Epididymis', 'Seminal vesicle', 'Bladder', 'B', 'Sperm move from the testes into the comma-shaped epididymis, where they mature and acquire motility over 2-3 weeks.'),
(319, 32, 'Which hormone working with testosterone stimulates Sertoli cells to promote spermatogenesis?', 'Follicle-Stimulating Hormone (FSH)', 'Estrogen', 'Oxytocin', 'Calcitonin', 'A', 'FSH acts on Sertoli cells in seminiferous tubules to stimulate androgen-binding protein release and drive spermatogenesis.'),
(320, 32, 'What haploid male gamete is produced at the end of spermiogenesis?', 'Spermatogonium', 'Spermatozoon (Sperm cell)', 'Primary spermatocyte', 'Zygote', 'B', 'Spermiogenesis transforms haploid spermatids into streamlined, flagellated spermatozoa.'),
(321, 33, 'What thick middle smooth muscle layer of the uterine wall generates labor contractions?', 'Perimetrium', 'Myometrium', 'Endometrium', 'Stratum basalis', 'B', 'The myometrium consists of interlocking smooth muscle bundles that contract forcefully during parturition.'),
(322, 33, 'What inner mucosal lining of the uterus undergoes monthly cyclic shedding during menstruation?', 'Perimetrium', 'Myometrium', 'Endometrium (Stratum functionalis)', 'Subcutis', 'C', 'The stratum functionalis of the endometrium thickens each cycle and is shed during menstruation if pregnancy does not occur.'),
(323, 33, 'Which ovarian hormone drives the secretory phase of the uterine cycle, causing glandular glycogen secretion?', 'Estrogen', 'Progesterone', 'FSH', 'Prolactin', 'B', 'Progesterone from the corpus luteum causes endometrial glands to secrete glycogen and spiral arteries to enlarge.'),
(324, 33, 'What narrowing anatomical lower gateway of the uterus projects into the vagina?', 'Fundus', 'Cervix', 'Isthmus', 'Corpus', 'B', 'The cervix is the narrow inferior neck of the uterus that opens into the vagina via the cervical os.'),
(325, 33, 'Which hormone released during labor stimulates powerful, positive-feedback myometrial contractions?', 'Progesterone', 'Oxytocin', 'hCG', 'Prolactin', 'B', 'Oxytocin from the posterior pituitary stimulates rhythmic, high-force uterine smooth muscle contractions during labor.'),
(326, 33, 'What dome-shaped superior region of the uterus lies above the entrance of the fallopian tubes?', 'Cervix', 'Fundus', 'Body', 'Internal os', 'B', 'The fundus is the rounded dome-shaped superior section of the uterus above the fallopian tube entries.'),
(327, 33, 'What embryonic hormone preserves the corpus luteum to prevent menstruation if implantation succeeds?', 'Estrogen', 'Human Chorionic Gonadotropin (hCG)', 'LH', 'FSH', 'B', 'hCG secreted by the blastocyst trophoblast keeps the corpus luteum active, maintaining progesterone levels.'),
(328, 33, 'Which permanent deep layer of the endometrium gives rise to a new functional layer after menstruation?', 'Stratum functionalis', 'Stratum basalis', 'Myometrium', 'Perimetrium', 'B', 'The stratum basalis does not shed during menstruation and regenerates the new stratum functionalis each cycle.'),
(329, 33, 'Implantation of a fertilized blastocyst outside the uterine cavity (e.g. in a fallopian tube) is termed an:', 'Endometriosis', 'Ectopic pregnancy', 'Fibroid', 'Infertility', 'B', 'An ectopic pregnancy occurs when a fertilized egg implants outside the uterine endometrial cavity.'),
(330, 33, 'What muscular process occurring during menstruation expels the unneeded endometrial functionalis?', 'Smooth muscle myometrial contractions', 'Skeletal muscle pumping', 'Peristalsis of ureters', 'Vasoconstriction', 'A', 'Prostaglandins trigger mild myometrial smooth muscle contractions that help shed and expel endometrial tissue.'),
(331, 34, 'In which anatomical region of the fallopian tube does fertilization normally take place?', 'Infundibulum', 'Ampulla', 'Isthmus', 'Interstitial segment', 'B', 'Fertilization typically takes place in the ampulla, the wide middle segment of the fallopian tube.'),
(332, 34, 'What finger-like projections at the distal end of the fallopian tube sweep the ovulated oocyte into the tube?', 'Villi', 'Fimbriae', 'Microvilli', 'Rugae', 'B', 'Fimbriae are finger-like muscular projections of the infundibulum that sweep over the ovary during ovulation.'),
(333, 34, 'What cell type in the fallopian tube lining beats rhythmically to propel the oocyte toward the uterus?', 'Ciliated columnar cells', 'Peg cells', 'Squamous cells', 'Goblet cells', 'A', 'Ciliated columnar epithelial cells beat rhythmically toward the uterus to transport the oocyte and early embryo.'),
(334, 34, 'What non-ciliated secretory cells in the fallopian tube mucosa produce nutrient fluid for the zygote?', 'Chief cells', 'Peg cells', 'Langerhans cells', 'Sertoli cells', 'B', 'Peg cells are non-ciliated secretory cells that provide fluid rich in nutrients and glycoprotein for the embryo.'),
(335, 34, 'How many anatomical regions compose each fallopian tube?', '2 regions', '4 regions', '6 regions', '3 regions', 'B', 'The fallopian tube is divided into 4 regions: infundibulum, ampulla, isthmus, and interstitial segment.'),
(336, 34, 'What combined mechanisms move the oocyte through the fallopian tube?', 'Peristalsis and ciliary action', 'Blood pressure and gravity', 'Active transport and diffusion', 'Skeletal muscle pumping', 'A', 'Smooth muscle peristaltic waves and ciliary beating work together to move the oocyte toward the uterus.'),
(337, 34, 'How long does transport of the fertilized egg through the fallopian tube to the uterus typically take?', '1 hour', '3-4 days', '14 days', '24 hours', 'B', 'Embryo transit through the fallopian tube to the uterine cavity takes approximately 3 to 4 days.'),
(338, 34, 'What dangerous condition occurs when a fertilized blastocyst implants inside the fallopian tube wall?', 'Tubal (ectopic) pregnancy', 'Endometriosis', 'Ovarian cyst', 'Uterine fibroid', 'A', 'A tubal ectopic pregnancy occurs when the blastocyst implants into the fallopian tube wall instead of reaching the uterus.'),
(339, 34, 'What funnel-shaped distal expansion of the fallopian tube opens into the peritoneal cavity near the ovary?', 'Isthmus', 'Infundibulum', 'Ampulla', 'Cervix', 'B', 'The infundibulum is the open, funnel-shaped distal end of the fallopian tube surrounded by fimbriae.'),
(340, 34, 'Surgical ligation or clipping of the fallopian tubes to prevent pregnancy is known as:', 'Hysterectomy', 'Tubal ligation', 'Vasectomy', 'Salpingectomy', 'B', 'Tubal ligation is a permanent contraceptive surgical procedure where the fallopian tubes are cut, tied, or sealed.'),
(341, 35, 'Where is the prostate gland positioned relative to the male urinary bladder?', 'Superior to the bladder', 'Directly inferior to the bladder', 'Lateral to the kidney', 'Posterior to the rectum', 'B', 'The prostate gland is located directly below (inferior to) the bladder, encircling the prostatic urethra.'),
(342, 35, 'What anatomical section of the male urethra passes directly through the center of the prostate gland?', 'Spongy urethra', 'Prostatic urethra', 'Membranous urethra', 'Penile urethra', 'B', 'The prostatic urethra passes directly through the core of the prostate gland.'),
(343, 35, 'What key enzyme secreted by the prostate gland liquefies coagulated semen post-ejaculation?', 'Amylase', 'Prostate-Specific Antigen (PSA)', 'Pepsin', 'Renin', 'B', 'Prostate-Specific Antigen (PSA) is a proteolytic serine protease enzyme that liquefies semen to enable sperm motility.'),
(344, 35, 'Approximately what percentage of total ejaculate volume is contributed by prostatic secretions?', '5%', '30%', '80%', '100%', 'B', 'The prostate gland contributes roughly 30% of total seminal fluid volume.'),
(345, 35, 'Which anatomical zone of the prostate is the primary site of Benign Prostatic Hyperplasia (BPH)?', 'Peripheral zone', 'Transition zone', 'Central zone', 'Fibromuscular stroma', 'B', 'BPH arises in the transition zone surrounding the proximal urethra, leading to urinary compression as men age.'),
(346, 35, 'Which anatomical zone of the prostate is the primary site where prostate adenocarcinomas develop?', 'Transition zone', 'Peripheral zone', 'Central zone', 'Urethral zone', 'B', 'Approximately 70% of prostate cancers originate in the outer peripheral zone, accessible via digital rectal exam.'),
(347, 35, 'Why is prostatic fluid slightly alkaline?', 'To kill sperm cells', 'To neutralize the acidic environment of the female vagina', 'To lower blood pressure', 'To produce glucose', 'B', 'Alkaline prostatic fluid neutralizes acidic vaginal secretions, enhancing sperm survival and motility.'),
(348, 35, 'What smooth muscle action propels prostatic secretions into the urethra during ejaculation?', 'Peristaltic wave', 'Sympathetic fibromuscular stroma contraction', 'Voluntary skeletal squeeze', 'Gravitational flow', 'B', 'Sympathetic nerve stimulation triggers smooth muscle contraction within the fibromuscular stroma during ejaculation.'),
(349, 35, 'What blood serum protein marker is commonly measured to screen for prostate cancer and inflammation?', 'Albumin', 'Prostate-Specific Antigen (PSA)', 'Hemoglobin', 'Bilirubin', 'B', 'Serum PSA levels are measured clinically to screen for prostate enlargement, prostatitis, and prostate cancer.'),
(350, 35, 'What androgen derivative converted by 5-alpha reductase drives prostatic epithelial growth and BPH?', 'Estrogen', 'Dihydrotestosterone (DHT)', 'Cortisol', 'Aldosterone', 'B', 'Dihydrotestosterone (DHT), converted from testosterone by 5-alpha reductase, stimulates prostate growth and BPH development.')
ON CONFLICT (id) DO UPDATE SET organ_id = EXCLUDED.organ_id, question_text = EXCLUDED.question_text, option_a = EXCLUDED.option_a, option_b = EXCLUDED.option_b, option_c = EXCLUDED.option_c, option_d = EXCLUDED.option_d, correct_option = EXCLUDED.correct_option, explanation = EXCLUDED.explanation;

-- 6. Insert Quiz Submissions for Sitta (password: password123)
INSERT INTO quiz_submissions (id, user_id, organ_id, score_percentage, completed_at) VALUES
(1, 1, 1, 80.00, '2026-07-10 10:15:00+00'),
(2, 1, 2, 70.00, '2026-07-12 14:30:00+00'),
(3, 1, 1, 100.00, '2026-07-14 09:45:00+00'),
(4, 1, 3, 90.00, '2026-07-15 16:20:00+00'),
(5, 1, 4, 85.00, '2026-07-16 11:10:00+00')
ON CONFLICT (id) DO UPDATE SET user_id = EXCLUDED.user_id, organ_id = EXCLUDED.organ_id, score_percentage = EXCLUDED.score_percentage, completed_at = EXCLUDED.completed_at;

-- 7. Adjust Sequence Generators
SELECT setval('body_systems_id_seq', 11);
SELECT setval('organs_id_seq', 35);
SELECT setval('users_id_seq', 1);
SELECT setval('health_logs_id_seq', 3);
SELECT setval('quiz_questions_id_seq', 350);
SELECT setval('quiz_submissions_id_seq', 5);
