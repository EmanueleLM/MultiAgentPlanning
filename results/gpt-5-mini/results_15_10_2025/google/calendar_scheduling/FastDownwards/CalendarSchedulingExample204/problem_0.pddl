(define (problem schedule-meeting-template)
  (:domain meeting-scheduling)

  ;; Slots are 30-minute discrete slots from 09:00-09:30 up to 16:30-17:00 on Monday.
  ;; Object names follow the pattern sHHMM (24-hour).
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot

    ;; Replace/add participant objects here (example below). Do NOT invent availability;
    ;; provide availability (free facts) in the :init section below according to your inputs.
    ;; Example participants (remove or replace with actual participants you provide):
    ;; alice bob carol - participant
  )

  ;; INIT: put participant object declarations and free facts here based on the availability you provide.
  ;; The assistant will convert your natural-language availability into (free <participant> <slot>) facts.
  ;; EXAMPLE (commented out) showing format:
  ;; ;(participant alice)
  ;; ;(participant bob)
  ;; ;(free alice s0900)
  ;; ;(free alice s0930)
  ;; ;(free bob   s0900)
  ;; ;(free bob   s0930)
  ;; The actual problem below must be generated from the availability you supply.
  (:init
    ;; Placeholder: no participants or free facts are included yet.
    ;; Provide participant availability and the assistant will generate a concrete problem
    ;; where the goal is the earliest slot that satisfies every agent's availability constraint.
  )

  ;; GOAL: will be set to the chosen slot and attendance for every participant,
  ;; once you supply participants and their availability. Example goal (to be generated):
  ;; (:goal (and (meeting-started s0900) (attends alice s0900) (attends bob s0900)))
  ;;
  ;; Currently left empty because participant availability has not been provided.
  (:goal (and))
)