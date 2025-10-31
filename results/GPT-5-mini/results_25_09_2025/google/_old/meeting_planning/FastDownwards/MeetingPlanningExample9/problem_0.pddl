(define (problem integrated-meet-mary-problem)
  (:domain integrated-meet-mary)

  (:objects
    traveler mary - person
    union-square nob-hill - location
  )

  (:init
    ;; Initial time: traveler arrives at Union Square at 09:00 -> 9*60 = 540 minutes since midnight
    (= (current-time) 540)

    ;; Traveler initial location as given by the first agent input
    (at traveler union-square)

    ;; Modeling decision: we place Mary at Nob Hill. Mary's availability window (12:00-16:15)
    ;; is enforced by the meeting action preconditions. We assume Mary will be at Nob Hill
    ;; during that window (i.e., she is present and does not leave during the required meeting).
    ;; This resolves the ambiguity in the two inputs: Mary's PDDL encoded availability only via
    ;; numeric constraints; here we assert her location explicitly to coordinate the two agents.
    (at mary nob-hill)

    ;; Public known travel durations (documented as comments; durations are encoded in actions):
    ;;  union-square -> nob-hill : 9 minutes
    ;;  nob-hill -> union-square : 7 minutes
  )

  ;; Global goal: traveler has met Mary for at least 75 minutes.
  ;; (modeled by the traveler_meet_mary action producing (met mary))
  (:goal (met mary))

  ;; Optional metric: minimize the finishing time (current-time) to find the earliest feasible schedule.
  (:metric minimize (current-time))

  ;; Additional comments about resolution of ambiguities:
  ;; - The original two agent fragments used different modelling styles (instantaneous actions
  ;;   with numeric increases vs. durative actions). We converted all actions to instantaneous
  ;;   effects that update a shared numeric clock (current-time) to remain compatible with
  ;;   FastDownward's numeric effects handling.
  ;; - Waiting is represented by "wait_until_720" actions for each agent to allow jumping forward
  ;;   to Mary's earliest availability without large action sequences. This is a pragmatic choice
  ;;   to keep plans compact while remaining faithful to the timing constraints.
)