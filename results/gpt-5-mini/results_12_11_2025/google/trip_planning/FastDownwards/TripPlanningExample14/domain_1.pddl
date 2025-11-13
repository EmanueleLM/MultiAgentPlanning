(define (domain travel-lyon-frankfurt-krakow)
  ;; Requirements: compatible with Fast Downward baseline
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    ;; you are in city ?c on day ?d (assignment)
    (at ?d - day ?c - city)
    ;; timeline cursor is currently at day ?d
    (current ?d - day)
    ;; successor relation over days
    (next ?d1 - day ?d2 - day)
    ;; day ?d has been assigned to city ?c
    (assigned ?d - day ?c - city)
    ;; city visited at least one full day
    (visited ?c - city)
    ;; allowed direct flight edge (bidirectional edges will be declared both ways)
    (edge ?c1 - city ?c2 - city)
    ;; markers (global)
    (spent_in_lyon)
    (spent_in_frankfurt)
    (spent_in_krakow)
    ;; attendance markers for Krakow on explicit days 8..10
    (attend_d8) (attend_d9) (attend_d10)
  )

  ;; Stay action: remain in same city and advance day along next
  (:action stay_d
    :parameters (?d - day ?c - city ?d2 - day)
    :precondition (and
      (current ?d)
      (at ?d ?c)
      (next ?d ?d2)
      ;; successor day must not already be assigned to any city (ensures one city per day)
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 frankfurt))
      (not (assigned ?d2 krakow))
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (at ?d2 ?c)
      (assigned ?d2 ?c)
      (visited ?c)
    )
  )

  ;; Fly action: use a direct flight edge and advance day along next
  (:action fly_d
    :parameters (?d - day ?from - city ?to - city ?d2 - day)
    :precondition (and
      (current ?d)
      (at ?d ?from)
      ;; flight must be allowed
      (edge ?from ?to)
      (next ?d ?d2)
      ;; successor day must not already be assigned
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 frankfurt))
      (not (assigned ?d2 krakow))
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (at ?d2 ?to)
      (assigned ?d2 ?to)
      (visited ?to)
    )
  )

  ;; Markers to set spent_in_* flags when at least one day assigned to that city
  (:action mark_spent_in_lyon
    :parameters (?d - day)
    :precondition (and (assigned ?d lyon) (not (spent_in_lyon)))
    :effect (spent_in_lyon)
  )

  (:action mark_spent_in_frankfurt
    :parameters (?d - day)
    :precondition (and (assigned ?d frankfurt) (not (spent_in_frankfurt)))
    :effect (spent_in_frankfurt)
  )

  (:action mark_spent_in_krakow
    :parameters (?d - day)
    :precondition (and (assigned ?d krakow) (not (spent_in_krakow)))
    :effect (spent_in_krakow)
  )

  ;; Attendance marker actions for Krakow on explicit days 8, 9, 10
  (:action mark_attend_d8
    :precondition (and (assigned d8 krakow) (not (attend_d8)))
    :effect (attend_d8)
  )
  (:action mark_attend_d9
    :precondition (and (assigned d9 krakow) (not (attend_d9)))
    :effect (attend_d9)
  )
  (:action mark_attend_d10
    :precondition (and (assigned d10 krakow) (not (attend_d10)))
    :effect (attend_d10)
  )
)