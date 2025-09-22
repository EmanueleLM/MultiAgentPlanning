(define (domain integrated-trip)
  (:requirements :strips :typing :negative-preconditions :equality :adl :action-costs)
  (:types city day)

  (:predicates
    (direct ?from ?to - city)
    (at ?c - city ?d - day)
    (next ?d1 ?d2 - day)
    (assigned ?d - day)
    (counted-frankfurt ?d - day)
    (counted-bucharest ?d - day)
    (frank-count-0) (frank-count-1) (frank-count-2) (frank-count-3) (frank-count-4)
    (frank-count-5) (frank-count-6) (frank-count-7) (frank-count-8) (frank-count-9) (frank-count-10)
    (buch-count-0) (buch-count-1) (buch-count-2) (buch-count-3) (buch-count-4)
    (buch-count-5) (buch-count-6) (buch-count-7) (buch-count-8) (buch-count-9) (buch-count-10)
  )

  (:action traveler-choose-start-frankfurt-k0
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (frank-count-0) (not (counted-frankfurt ?d)))
    :effect (and (at frankfurt ?d) (assigned ?d) (counted-frankfurt ?d)
                 (not (frank-count-0)) (frank-count-1))
    :cost 1
  )

  (:action traveler-choose-start-frankfurt-k1
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (frank-count-1) (not (counted-frankfurt ?d)))
    :effect (and (at frankfurt ?d) (assigned ?d) (counted-frankfurt ?d)
                 (not (frank-count-1)) (frank-count-2))
    :cost 1
  )

  (:action traveler-choose-start-frankfurt-k2
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (frank-count-2) (not (counted-frankfurt ?d)))
    :effect (and (at frankfurt ?d) (assigned ?d) (counted-frankfurt ?d)
                 (not (frank-count-2)) (frank-count-3))
    :cost 1
  )

  (:action traveler-choose-start-frankfurt-k3
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (frank-count-3) (not (counted-frankfurt ?d)))
    :effect (and (at frankfurt ?d) (assigned ?d) (counted-frankfurt ?d)
                 (not (frank-count-3)) (frank-count-4))
    :cost 1
  )

  (:action traveler-choose-start-frankfurt-k4
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (frank-count-4) (not (counted-frankfurt ?d)))
    :effect (and (at frankfurt ?d) (assigned ?d) (counted-frankfurt ?d)
                 (not (frank-count-4)) (frank-count-5))
    :cost 1
  )

  (:action traveler-choose-start-frankfurt-k5
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (frank-count-5) (not (counted-frankfurt ?d)))
    :effect (and (at frankfurt ?d) (assigned ?d) (counted-frankfurt ?d)
                 (not (frank-count-5)) (frank-count-6))
    :cost 1
  )

  (:action traveler-choose-start-frankfurt-k6
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (frank-count-6) (not (counted-frankfurt ?d)))
    :effect (and (at frankfurt ?d) (assigned ?d) (counted-frankfurt ?d)
                 (not (frank-count-6)) (frank-count-7))
    :cost 1
  )

  (:action traveler-choose-start-frankfurt-k7
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (frank-count-7) (not (counted-frankfurt ?d)))
    :effect (and (at frankfurt ?d) (assigned ?d) (counted-frankfurt ?d)
                 (not (frank-count-7)) (frank-count-8))
    :cost 1
  )

  (:action traveler-choose-start-frankfurt-k8
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (frank-count-8) (not (counted-frankfurt ?d)))
    :effect (and (at frankfurt ?d) (assigned ?d) (counted-frankfurt ?d)
                 (not (frank-count-8)) (frank-count-9))
    :cost 1
  )

  (:action traveler-choose-start-frankfurt-k9
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (frank-count-9) (not (counted-frankfurt ?d)))
    :effect (and (at frankfurt ?d) (assigned ?d) (counted-frankfurt ?d)
                 (not (frank-count-9)) (frank-count-10))
    :cost 1
  )

  (:action traveler-choose-start-bucharest-k0
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (buch-count-0) (not (counted-bucharest ?d)))
    :effect (and (at bucharest ?d) (assigned ?d) (counted-bucharest ?d)
                 (not (buch-count-0)) (buch-count-1))
    :cost 1
  )

  (:action traveler-choose-start-bucharest-k1
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (buch-count-1) (not (counted-bucharest ?d)))
    :effect (and (at bucharest ?d) (assigned ?d) (counted-bucharest ?d)
                 (not (buch-count-1)) (buch-count-2))
    :cost 1
  )

  (:action traveler-choose-start-bucharest-k2
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (buch-count-2) (not (counted-bucharest ?d)))
    :effect (and (at bucharest ?d) (assigned ?d) (counted-bucharest ?d)
                 (not (buch-count-2)) (buch-count-3))
    :cost 1
  )

  (:action traveler-choose-start-bucharest-k3
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (buch-count-3) (not (counted-bucharest ?d)))
    :effect (and (at bucharest ?d) (assigned ?d) (counted-bucharest ?d)
                 (not (buch-count-3)) (buch-count-4))
    :cost 1
  )

  (:action traveler-choose-start-bucharest-k4
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (buch-count-4) (not (counted-bucharest ?d)))
    :effect (and (at bucharest ?d) (assigned ?d) (counted-bucharest ?d)
                 (not (buch-count-4)) (buch-count-5))
    :cost 1
  )

  (:action traveler-choose-start-bucharest-k5
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (buch-count-5) (not (counted-bucharest ?d)))
    :effect (and (at bucharest ?d) (assigned ?d) (counted-bucharest ?d)
                 (not (buch-count-5)) (buch-count-6))
    :cost 1
  )

  (:action traveler-choose-start-bucharest-k6
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (buch-count-6) (not (counted-bucharest ?d)))
    :effect (and (at bucharest ?d) (assigned ?d) (counted-bucharest ?d)
                 (not (buch-count-6)) (buch-count-7))
    :cost 1
  )

  (:action traveler-choose-start-bucharest-k7
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (buch-count-7) (not (counted-bucharest ?d)))
    :effect (and (at bucharest ?d) (assigned ?d) (counted-bucharest ?d)
                 (not (buch-count-7)) (buch-count-8))
    :cost 1
  )

  (:action traveler-choose-start-bucharest-k8
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (buch-count-8) (not (counted-bucharest ?d)))
    :effect (and (at bucharest ?d) (assigned ?d) (counted-bucharest ?d)
                 (not (buch-count-8)) (buch-count-9))
    :cost 1
  )

  (:action traveler-choose-start-bucharest-k9
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)) (buch-count-9) (not (counted-bucharest ?d)))
    :effect (and (at bucharest ?d) (assigned ?d) (counted-bucharest ?d)
                 (not (buch-count-9)) (buch-count-10))
    :cost 1
  )

  (:action traveler-choose-start-stuttgart
    :parameters (?d - day)
    :precondition (and (= ?d d1) (not (assigned ?d)))
    :effect (and (at stuttgart ?d) (assigned ?d))
    :cost 1
  )

  (:action traveler-stay-frankfurt-k0
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-0) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-0)) (frank-count-1))
    :cost 1
  )

  (:action traveler-stay-frankfurt-k1
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-1) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-1)) (frank-count-2))
    :cost 1
  )

  (:action traveler-stay-frankfurt-k2
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-2) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-2)) (frank-count-3))
    :cost 1
  )

  (:action traveler-stay-frankfurt-k3
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-3) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-3)) (frank-count-4))
    :cost 1
  )

  (:action traveler-stay-frankfurt-k4
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-4) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-4)) (frank-count-5))
    :cost 1
  )

  (:action traveler-stay-frankfurt-k5
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-5) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-5)) (frank-count-6))
    :cost 1
  )

  (:action traveler-stay-frankfurt-k6
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-6) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-6)) (frank-count-7))
    :cost 1
  )

  (:action traveler-stay-frankfurt-k7
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-7) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-7)) (frank-count-8))
    :cost 1
  )

  (:action traveler-stay-frankfurt-k8
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-8) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-8)) (frank-count-9))
    :cost 1
  )

  (:action traveler-stay-frankfurt-k9
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-9) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-9)) (frank-count-10))
    :cost 1
  )

  (:action traveler-stay-bucharest-k0
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-0) (not (counted-bucharest ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-0)) (buch-count-1))
    :cost 1
  )

  (:action traveler-stay-bucharest-k1
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-1) (not (counted-bucharest ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-1)) (buch-count-2))
    :cost 1
  )

  (:action traveler-stay-bucharest-k2
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-2) (not (counted-bucharest ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-2)) (buch-count-3))
    :cost 1
  )

  (:action traveler-stay-bucharest-k3
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-3) (not (counted-bucharest ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-3)) (buch-count-4))
    :cost 1
  )

  (:action traveler-stay-bucharest-k4
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-4) (not (counted-bucharest ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-4)) (buch-count-5))
    :cost 1
  )

  (:action traveler-stay-bucharest-k5
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-5) (not (counted-bucharest ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-5)) (buch-count-6))
    :cost 1
  )

  (:action traveler-stay-bucharest-k6
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-6) (not (counted-bucharest ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-6)) (buch-count-7))
    :cost 1
  )

  (:action traveler-stay-bucharest-k7
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-7) (not (counted-bucharest ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-7)) (buch-count-8))
    :cost 1
  )

  (:action traveler-stay-bucharest-k8
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-8) (not (counted-bucharest ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-8)) (buch-count-9))
    :cost 1
  )

  (:action traveler-stay-bucharest-k9
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-9) (not (counted-bucharest ?dnext)))
    :effect (and (not (at bucharest ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-9)) (buch-count-10))
    :cost 1
  )

  (:action traveler-stay-stuttgart
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (next ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at stuttgart ?dnext) (assigned ?dnext))
    :cost 1
  )

  (:action scheduler-fly-bucharest-to-frankfurt-k0
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-0) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-0)) (frank-count-1))
    :cost 1
  )

  (:action scheduler-fly-bucharest-to-frankfurt-k1
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-1) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-1)) (frank-count-2))
    :cost 1
  )

  (:action scheduler-fly-bucharest-to-frankfurt-k2
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-2) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-2)) (frank-count-3))
    :cost 1
  )

  (:action scheduler-fly-bucharest-to-frankfurt-k3
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-3) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-3)) (frank-count-4))
    :cost 1
  )

  (:action scheduler-fly-bucharest-to-frankfurt-k4
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-4) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-4)) (frank-count-5))
    :cost 1
  )

  (:action scheduler-fly-bucharest-to-frankfurt-k5
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-5) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-5)) (frank-count-6))
    :cost 1
  )

  (:action scheduler-fly-bucharest-to-frankfurt-k6
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-6) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-6)) (frank-count-7))
    :cost 1
  )

  (:action scheduler-fly-bucharest-to-frankfurt-k7
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-7) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-7)) (frank-count-8))
    :cost 1
  )

  (:action scheduler-fly-bucharest-to-frankfurt-k8
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-8) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-8)) (frank-count-9))
    :cost 1
  )

  (:action scheduler-fly-bucharest-to-frankfurt-k9
    :parameters (?d ?dnext - day)
    :precondition (and (at bucharest ?d) (direct bucharest frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-9) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at bucharest ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-9)) (frank-count-10))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-bucharest-k0
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-0) (not (counted-bucharest ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-0)) (buch-count-1))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-bucharest-k1
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-1) (not (counted-bucharest ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-1)) (buch-count-2))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-bucharest-k2
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-2) (not (counted-bucharest ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-2)) (buch-count-3))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-bucharest-k3
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-3) (not (counted-bucharest ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-3)) (buch-count-4))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-bucharest-k4
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-4) (not (counted-bucharest ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-4)) (buch-count-5))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-bucharest-k5
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-5) (not (counted-bucharest ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-5)) (buch-count-6))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-bucharest-k6
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-6) (not (counted-bucharest ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-6)) (buch-count-7))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-bucharest-k7
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-7) (not (counted-bucharest ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-7)) (buch-count-8))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-bucharest-k8
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-8) (not (counted-bucharest ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-8)) (buch-count-9))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-bucharest-k9
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt bucharest) (next ?d ?dnext) (not (assigned ?dnext)) (buch-count-9) (not (counted-bucharest ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at bucharest ?dnext) (assigned ?dnext) (counted-bucharest ?dnext)
                 (not (buch-count-9)) (buch-count-10))
    :cost 1
  )

  (:action scheduler-fly-frankfurt-to-stuttgart
    :parameters (?d ?dnext - day)
    :precondition (and (at frankfurt ?d) (direct frankfurt stuttgart) (next ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (not (at frankfurt ?d)) (at stuttgart ?dnext) (assigned ?dnext))
    :cost 1
  )

  (:action scheduler-fly-stuttgart-to-frankfurt-k0
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-0) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-0)) (frank-count-1))
    :cost 1
  )

  (:action scheduler-fly-stuttgart-to-frankfurt-k1
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-1) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-1)) (frank-count-2))
    :cost 1
  )

  (:action scheduler-fly-stuttgart-to-frankfurt-k2
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-2) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-2)) (frank-count-3))
    :cost 1
  )

  (:action scheduler-fly-stuttgart-to-frankfurt-k3
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-3) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-3)) (frank-count-4))
    :cost 1
  )

  (:action scheduler-fly-stuttgart-to-frankfurt-k4
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-4) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-4)) (frank-count-5))
    :cost 1
  )

  (:action scheduler-fly-stuttgart-to-frankfurt-k5
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-5) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-5)) (frank-count-6))
    :cost 1
  )

  (:action scheduler-fly-stuttgart-to-frankfurt-k6
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-6) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-6)) (frank-count-7))
    :cost 1
  )

  (:action scheduler-fly-stuttgart-to-frankfurt-k7
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-7) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-7)) (frank-count-8))
    :cost 1
  )

  (:action scheduler-fly-stuttgart-to-frankfurt-k8
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-8) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-8)) (frank-count-9))
    :cost 1
  )

  (:action scheduler-fly-stuttgart-to-frankfurt-k9
    :parameters (?d ?dnext - day)
    :precondition (and (at stuttgart ?d) (direct stuttgart frankfurt) (next ?d ?dnext) (not (assigned ?dnext)) (frank-count-9) (not (counted-frankfurt ?dnext)))
    :effect (and (not (at stuttgart ?d)) (at frankfurt ?dnext) (assigned ?dnext) (counted-frankfurt ?dnext)
                 (not (frank-count-9)) (frank-count-10))
    :cost 1
  )
)