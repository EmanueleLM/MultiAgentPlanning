;; PROBLEM TEMPLATE — Please fill in participants and availability (or provide them to me
;; and I'll fill this in and select the earliest feasible slot).
;;
;; IMPORTANT: Do not invent availability. Provide each participant's availability as a
;; list of 30-minute slots between 09:00 and 17:00 (inclusive start times: 09:00..16:30).
;; Treat any natural-language preference (e.g., "earliest", "avoid 15:00") as a hard constraint.
;;
;; Timeslot names (machine-readable) correspond to these 30-minute slots:
;;  slot09_00, slot09_30, slot10_00, slot10_30, slot11_00, slot11_30,
;;  slot12_00, slot12_30, slot13_00, slot13_30, slot14_00, slot14_30,
;;  slot15_00, slot15_30, slot16_00, slot16_30
;;
;; Provide availability like:
;;   Participants: alice, bob
;;   Alice available: slot09_00 slot09_30 slot10_00 ...
;;   Bob available:   slot09_30 slot10_00 ...
;;
;; After you provide that, I will:
;;  - compute the earliest slot between 09:00 and 17:00 where all participants are available
;;  - generate a fully filled PDDL problem (below) with the goal (meeting-at <earliest-slot>)
;;  - ensure the resulting problem is solvable by FastDownward

(define (problem schedule-monday-TEMPLATE)
  (:domain meeting-schedule)

  (:objects
    ;; Replace these placeholders with your actual participant object names, e.g.:
    ;; alice bob carol - participant
    <<PARTICIPANT_OBJECTS>>

    ;; timeslot objects (fixed for 09:00–17:00 in 30-minute steps)
    slot09_00 slot09_30 slot10_00 slot10_30 slot11_00 slot11_30 slot12_00 slot12_30
    slot13_00 slot13_30 slot14_00 slot14_30 slot15_00 slot15_30 slot16_00 slot16_30 - timeslot
  )

  (:init
    ;; Fill in availability predicates only from the provided data. Example:
    ;; (available alice slot09_30)
    ;; (available bob   slot09_30)
    <<AVAILABILITY_PREDICATES>>
  )

  ;; The goal below must be the chosen earliest timeslot that satisfies all constraints.
  ;; I will compute that earliest slot after you provide availabilities and then replace
  ;; <<EARLIEST_SLOT>> with e.g. slot09_30.
  (:goal (meeting-at <<EARLIEST_SLOT>>))
)