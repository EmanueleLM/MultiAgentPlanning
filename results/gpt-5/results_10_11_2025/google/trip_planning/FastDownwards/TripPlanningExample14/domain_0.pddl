(define (domain itinerary-10days)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :equality)
  (:types city day)
  (:predicates
    (at ?c - city)                       ; current city
    (current ?d - day)                   ; current day pointer
    (next ?d1 - day ?d2 - day)           ; successor day relation
    (assigned ?d - day)                  ; day ?d has been allocated exactly once
    (visited ?c - city)                  ; visited city at least once
    (edge ?c1 - city ?c2 - city)         ; direct flight connection
    (spent_in_lyon)                      ; at least one day spent in Lyon
    (spent_in_frankfurt)                 ; at least one day spent in Frankfurt
    (spent_in_krakow)                    ; at least one day spent in Krakow
    (attend_d8)                          ; attended Krakow show on day 8
    (attend_d9)                          ; attended Krakow show on day 9
    (attend_d10)                         ; attended Krakow show on day 10
    (on ?d - day ?c - city)              ; audit witness: day ?d was spent in city ?c
  )

  ; Stay in the same city for day ?d, advance to next day, and record the allocation.
  (:action stay_d
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (not (current ?d))

      ; mark city spending and visit
      (when (at lyon)      (and (visited lyon)      (spent_in_lyon)      (on ?d lyon)))
      (when (at frankfurt) (and (visited frankfurt) (spent_in_frankfurt) (on ?d frankfurt)))
      (when (at krakow)    (and (visited krakow)    (spent_in_krakow)    (on ?d krakow)))

      ; attendance only if the stay occurs in Krakow on the show days
      (when (and (current d8)  (at krakow)) (attend_d8))
      (when (and (current d9)  (at krakow)) (attend_d9))
      (when (and (current d10) (at krakow)) (attend_d10))

      ; advance the day along next (self-loop on d10 allows allocating day 10)
      (when (and (current d1)  (next d1 d2))   (current d2))
      (when (and (current d2)  (next d2 d3))   (current d3))
      (when (and (current d3)  (next d3 d4))   (current d4))
      (when (and (current d4)  (next d4 d5))   (current d5))
      (when (and (current d5)  (next d5 d6))   (current d6))
      (when (and (current d6)  (next d6 d7))   (current d7))
      (when (and (current d7)  (next d7 d8))   (current d8))
      (when (and (current d8)  (next d8 d9))   (current d9))
      (when (and (current d9)  (next d9 d10))  (current d10))
      (when (and (current d10) (next d10 d10)) (current d10))
    )
  )

  ; Fly on day ?d from ?from to ?to along an edge, advance to next day, and record the allocation.
  (:action fly_d
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (not (assigned ?d))
      (at ?from)
      (edge ?from ?to)
    )
    :effect (and
      (assigned ?d)
      (not (current ?d))
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (on ?d ?to)

      ; mark city spending
      (when (= ?to lyon)      (spent_in_lyon))
      (when (= ?to frankfurt) (spent_in_frankfurt))
      (when (= ?to krakow)    (spent_in_krakow))

      ; attendance when flying into Krakow on the show days
      (when (and (current d8)  (= ?to krakow)) (attend_d8))
      (when (and (current d9)  (= ?to krakow)) (attend_d9))
      (when (and (current d10) (= ?to krakow)) (attend_d10))

      ; advance the day along next (self-loop on d10 allows allocating day 10)
      (when (and (current d1)  (next d1 d2))   (current d2))
      (when (and (current d2)  (next d2 d3))   (current d3))
      (when (and (current d3)  (next d3 d4))   (current d4))
      (when (and (current d4)  (next d4 d5))   (current d5))
      (when (and (current d5)  (next d5 d6))   (current d6))
      (when (and (current d6)  (next d6 d7))   (current d7))
      (when (and (current d7)  (next d7 d8))   (current d8))
      (when (and (current d8)  (next d8 d9))   (current d9))
      (when (and (current d9)  (next d9 d10))  (current d10))
      (when (and (current d10) (next d10 d10)) (current d10))
    )
  )
)