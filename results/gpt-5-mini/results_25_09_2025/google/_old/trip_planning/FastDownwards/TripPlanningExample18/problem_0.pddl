(define (problem combined-trip)
  (:domain combined-travel)
  (:objects
    amsterdam vilnius bucharest - city
  )

  (:init
    ;; Trip timing: start on day 1
    (= (day) 1)

    ;; Remaining planned stays.
    ;; The original agents' inputs were inconsistent (sum > available days).
    ;; Here we resolve the ambiguity so the trip fits an 11-day itinerary (11 day-advances -> day = 12).
    ;; Chosen distribution: Amsterdam 4, Vilnius 1, Bucharest 6  (total 11)
    (= (remain amsterdam) 4)
    (= (remain vilnius) 1)
    (= (remain bucharest) 6)

    ;; Direct flights available (both directions)
    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct vilnius amsterdam)
    (direct amsterdam vilnius)

    ;; Mark Bucharest for flight-planner meeting preconditions
    (is-bucharest bucharest)

    ;; Starting location: both agents see the traveler as in/amsterdam
    (at amsterdam)
    (in amsterdam)
    (visited amsterdam)

    ;; Meeting flags are false by absence of predicates
    ;; started is false by absence
  )

  ;; Goal: satisfy both agents' requirements in a single integrated plan:
  ;; - finish the overall 11-day trip (day = 12 after 11 advances)
  ;; - fulfill all remaining stay requirements (remain = 0)
  ;; - both meeting predicates (flight-planner's met and traveler's met-friends) must be true
  ;; - all cities visited
  (:goal
    (and
      ;; 11-day trip modeled as day = 12 (start at 1 and perform 11 day-advances)
      (= (day) 12)

      ;; All planned stays satisfied
      (= (remain amsterdam) 0)
      (= (remain vilnius) 0)
      (= (remain bucharest) 0)

      ;; Meeting recorded by both agents (ensures that the meeting in Bucharest occurs between day 6 and 11)
      (met)
      (met-friends)

      ;; All cities visited at some point
      (visited amsterdam)
      (visited vilnius)
      (visited bucharest)
    )
  )
)