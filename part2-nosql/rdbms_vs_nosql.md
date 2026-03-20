## Database Recommendation

For a healthcare startup building a patient management system, I would recommend
MySQL as the primary database. Patient data such as medical histories, diagnoses,
prescriptions, and billing records is highly structured and requires strict
consistency. MySQL is ACID-compliant, meaning every transaction is Atomic,
Consistent, Isolated, and Durable. This is critical in healthcare where partial
or inconsistent writes — such as recording a prescription without linking it to
the correct patient — could cause serious harm.

MongoDB, by contrast, follows BASE principles (Basically Available, Soft state,
Eventually Consistent), which prioritizes availability over immediate consistency.
While this makes MongoDB highly scalable, eventual consistency is not acceptable
for core patient records where accuracy is a legal and safety requirement.

From a CAP theorem perspective, MySQL prioritizes Consistency and Partition
tolerance (CP), while MongoDB prioritizes Availability and Partition tolerance
(AP). For a patient management system, consistency must never be sacrificed,
which makes MySQL the safer choice for the core system.

However, if the startup also needs to add a fraud detection module, the answer
changes partially. Fraud detection requires analyzing large volumes of
semi-structured, rapidly changing transaction logs and behavioral patterns in
near real-time. This type of workload is better suited to MongoDB or a
combination of both systems. A hybrid architecture would work best — MySQL
handles structured patient and billing records where ACID compliance is
essential, while MongoDB manages the high-volume, flexible data streams needed
for fraud detection. This way, the startup gets strong consistency where it
matters and scalability where it is needed.