(define (problem meeting-2025-10-21)
  (:domain meeting-scheduling)

  (:objects
    alice bob carol - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - slot
  )

  ;; initial numeric values and availability — REPLACE the availability and bob-interruption placeholders
  (:init
    ;; reset total-cost
    (= (total-cost) 0)

    ;; slot indices (fixed)
    (= (slot-index t0) 0)
    (= (slot-index t1) 1)
    (= (slot-index t2) 2)
    (= (slot-index t3) 3)
    (= (slot-index t4) 4)
    (= (slot-index t5) 5)
    (= (slot-index t6) 6)
    (= (slot-index t7) 7)
    (= (slot-index t8) 8)
    (= (slot-index t9) 9)
    (= (slot-index t10) 10)
    (= (slot-index t11) 11)
    (= (slot-index t12) 12)
    (= (slot-index t13) 13)
    (= (slot-index t14) 14)
    (= (slot-index t15) 15)

    ;; -------------------------
    ;; AVAILABILITY FACTS
    ;; Replace the following placeholder lines with the actual structured availability facts
    ;; provided by the three agents. Example:
    ;;   (available alice t1)
    ;;   (available bob   t1)
    ;;   (available carol t1)
    ;; Only include facts that were explicitly provided.
    ;; -------------------------

    ;;; <<PLACEHOLDER START: Replace these example lines with your agents' availability facts>>
    ;;; Example (REMOVE or REPLACE these example lines):
    ;; (available alice t1)
    ;; (available alice t10)
    ;; (available bob t1)
    ;; (available bob t2)
    ;; (available carol t1)
    ;; (available carol t10)
    ;;; <<PLACEHOLDER END>>

    ;; -------------------------
    ;; BOB INTERRUPTION COSTS
    ;; Replace bob-interruption values below to encode how disruptive scheduling
    ;; a meeting in each slot would be to Bob's morning schedule.
    ;; Use non-negative integers; 0 = not interrupting, larger = more interrupting.
    ;; If you have exact constraints (hard constraints) from Bob's schedule that forbid some slots,
    ;; do NOT set availability for those slots for Bob; instead, keep availability absent for those slots.
    ;; -------------------------

    ;; Default placeholders: set all bob-interruption values to 0. Replace each with the true cost.
    (= (bob-interruption t0) 0)
    (= (bob-interruption t1) 0)
    (= (bob-interruption t2) 0)
    (= (bob-interruption t3) 0)
    (= (bob-interruption t4) 0)
    (= (bob-interruption t5) 0)
    (= (bob-interruption t6) 0)
    (= (bob-interruption t7) 0)
    (= (bob-interruption t8) 0)
    (= (bob-interruption t9) 0)
    (= (bob-interruption t10) 0)
    (= (bob-interruption t11) 0)
    (= (bob-interruption t12) 0)
    (= (bob-interruption t13) 0)
    (= (bob-interruption t14) 0)
    (= (bob-interruption t15) 0)

    ;; Initially no meeting scheduled
    ;; (meeting-set) is false by default; no need to initialize.
  )

  ;; Goal: some slot is scheduled (meeting-set true)
  (:goal (meeting-set))

  ;; Minimize the total-cost as explained above:
  ;; Primary objective: minimize slot-index (via large multiplier 100).
  ;; Secondary objective: minimize bob-interruption.
  (:metric minimize (total-cost))
)