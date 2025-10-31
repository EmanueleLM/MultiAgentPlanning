tags) that defines the 30-minute time slots from 09:00 to 16:30, establishes numeric indices (0..15) for earliest-first optimization, and provides commented placeholders where you must list participant objects and the (free <participant> <slot>) facts for each participant. Do not invent availability; replace the placeholders with the real availability facts you provide.

After you supply participant availabilities, I'll generate a complete problem instance (with participant names and free facts filled in) and run an earliest-first scheduling objective.

<domain>
(define (domain meeting-scheduling)
  (:requirements :typing :fluents :adl :negative-preconditions :equality)
  (:types participant time)
  (:predicates
    (slot ?t - time)
    (free ?p - participant ?t - time)         ; participant ?p is free at time ?t
    (attending ?p - participant)              ; participant ?p is set to attend
    (meeting-scheduled)                       ; meeting has been scheduled
    (meeting-start ?t - time)                 ; meeting starts at time ?t
  )
  (:functions
    (time-index ?t - time)                    ; integer index per time slot for ordering
    (meeting-start-index)                     ; numeric index assigned when scheduled
  )

  ;; Schedule the meeting at a particular 30-min time slot ?t.
  ;; Preconditions:
  ;;   - a slot exists
  ;;   - meeting not already scheduled
  ;;   - every participant is free at ?t  (quantified precondition)
  ;; Effects:
  ;;   - meeting scheduled, meeting-start recorded
  ;;   - every participant becomes attending and is no longer free at ?t
  (:action schedule-meeting
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (not (meeting-scheduled))
      (forall (?p - participant) (free ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?t)
      (assign (meeting-start-index) (time-index ?t))
      (forall (?p - participant)
        (and
          (attending ?p)
          (not (free ?p ?t))
        )
      )
    )
  )
)
</domain>

<problem>
(define (problem schedule-one-30min)
  (:domain meeting-scheduling)
  (:objects
    ;; Time slots (30-minute boundaries) from 09:00 to 16:30 inclusive
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time

    ;; Replace the following placeholder participants with the real participant names.
    ;; Example: alice bob carol - participant
    ;; DO NOT leave these placeholder names if you will supply participants.
    ;; Provide all participant objects; every participant listed must attend the meeting.
    ;; <--- REPLACE / FILL IN participants BELOW --->
    ;; Example:
    ;; alice bob carol - participant
  )

  ;; INITIAL STATE
  (:init
    ;; declare valid slots
    (slot t09_00) (slot t09_30) (slot t10_00) (slot t10_30)
    (slot t11_00) (slot t11_30) (slot t12_00) (slot t12_30)
    (slot t13_00) (slot t13_30) (slot t14_00) (slot t14_30)
    (slot t15_00) (slot t15_30) (slot t16_00) (slot t16_30)

    ;; numeric indices for earliest-first optimization (0 = 09:00, 1 = 09:30, ..., 15 = 16:30)
    (= (time-index t09_00) 0)
    (= (time-index t09_30) 1)
    (= (time-index t10_00) 2)
    (= (time-index t10_30) 3)
    (= (time-index t11_00) 4)
    (= (time-index t11_30) 5)
    (= (time-index t12_00) 6)
    (= (time-index t12_30) 7)
    (= (time-index t13_00) 8)
    (= (time-index t13_30) 9)
    (= (time-index t14_00) 10)
    (= (time-index t14_30) 11)
    (= (time-index t15_00) 12)
    (= (time-index t15_30) 13)
    (= (time-index t16_00) 14)
    (= (time-index t16_30) 15)

    ;; meeting-start-index initialized to a large value (optional). The planner will assign it.
    (= (meeting-start-index) 999)

    ;; AVAILABILITY FACTS FOR EACH PARTICIPANT:
    ;; Replace the following commented examples with concrete (free <participant> <slot>) facts,
    ;; one fact per free slot per participant. Do NOT invent availability; use the inputs you have.
    ;;
    ;; Example where alice is free at 09:00, 09:30, 10:00:
    ;; (free alice t09_00)
    ;; (free alice t09_30)
    ;; (free alice t10_00)
    ;;
    ;; Example where bob is free at 09:30, 10:00:
    ;; (free bob t09_30)
    ;; (free bob t10_00)
    ;;
    ;; Replace all the following commented lines with the actual facts (uncomment and/or add).
    ;; <--- INSERT PARTICIPANT AVAILABILITY FACTS HERE --->
  )

  ;; GOAL: meeting has been scheduled. Metric minimizes start index to prioritize earliest slot.
  (:goal (meeting-scheduled))

  ;; Minimize the numeric meeting-start-index to choose earliest feasible slot
  (:metric minimize (meeting-start-index))
)