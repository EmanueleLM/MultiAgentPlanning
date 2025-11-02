(define (problem meet-problem)
  (:domain meet-domain)
  ;; Objects: two agents and two locations
  (:objects
    traveler mary - agent
    union_square nob_hill - location
  )

  ;; Comments documenting modeling/resolutions:
  ;; - Time expressed in minutes since midnight: 09:00 == 540, 12:00 == 720, 16:15 == 975.
  ;; - Mary's availability window is 12:00 (720) to 16:15 (975). Mary is NOT assumed at Nob Hill
  ;;   before 720; she must execute (mary-start) at time >= 720 to be present.
  ;; - Traveler arrives at Union Square at 09:00 (540).
  ;; - Travel times used as numeric increases: US -> NH = 9, NH -> US = 7.
  ;; - Meeting minimum duration is modeled as exactly 75 minutes for meeting action; this meets the
  ;;   "at least 75 minutes" requirement and ensures feasibility checks against Mary's end time.
  (:init
    (at traveler union_square)
    ;; Mary is not at Nob Hill initially; absence is modeled by not including (at mary nob_hill).
    (= (time) 540)
  )

  ;; Global goal: the traveler and Mary meet for at least 75 minutes during Mary's Nob Hill window.
  ;; This is represented by the predicate (met), achieved by traveler-meet-mary action.
  (:goal (and (met)))
)