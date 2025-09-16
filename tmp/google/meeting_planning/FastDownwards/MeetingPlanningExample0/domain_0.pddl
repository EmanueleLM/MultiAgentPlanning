(define (domain meet-steph-twoagents)

  (:requirements :typing :durative-actions :numeric-fluents)

  (:types location person)

  ; Predicates
  (:predicates
     (at ?p - person ?l - location)
     (met ?pl - person ?sp - person)
  )

  ; Constants (persons and locations)
  (:constants planner stephanie alex Marina Mission - location)

  ; Time as a numeric function
  (:functions (time))

  ; Travel and wait actions for Planner (the "you")
  (:durative-action planner-travel-to-mission
     :duration (= ?dur 20)
     :condition (at start (at planner Marina))
     :effect (and (at end (not (at planner Marina)))
                    (at end (at planner Mission))
                    (increase (time) 20))
  )

  (:durative-action planner-travel-to-marina
     :duration (= ?dur 19)
     :condition (at start (at planner Mission))
     :effect (and (at end (not (at planner Mission)))
                    (at end (at planner Marina))
                    (increase (time) 19))
  )

  (:durative-action planner-wait-marina
     :duration (= ?dur 10)
     :condition (at start (at planner Marina))
     :effect (increase (time) 10)
  )

  (:durative-action planner-wait-mission
     :duration (= ?dur 10)
     :condition (at start (at planner Mission))
     :effect (increase (time) 10)
  )

  ; Travel and wait actions for Stephanie
  (:durative-action stephanie-travel-to-mission
     :duration (= ?dur 20)
     :condition (over all (at stephanie Marina))
     :effect (and (at start (not (at stephanie Marina)))
                    (at end (at stephanie Mission)))
  )

  (:durative-action stephanie-travel-to-marina
     :duration (= ?dur 19)
     :condition (over all (at stephanie Mission))
     :effect (and (at start (not (at stephanie Mission)))
                    (at end (at stephanie Marina)))
  )

  (:durative-action stephanie-wait-marina
     :duration (= ?dur 10)
     :condition (at start (at stephanie Marina))
     :effect (increase (time) 10)
  )

  (:durative-action stephanie-wait-mission
     :duration (= ?dur 10)
     :condition (at start (at stephanie Mission))
     :effect (increase (time) 10)
  )

  ; Travel actions for Alex (availability)
  (:durative-action alex-travel-to-mission
     :duration (= ?dur 20)
     :condition (over all (at alex Marina))
     :effect (and (at start (not (at alex Marina)))
                    (at end (at alex Mission)))
  )

  (:durative-action alex-travel-to-marina
     :duration (= ?dur 19)
     :condition (over all (at alex Mission))
     :effect (and (at start (not (at alex Mission)))
                    (at end (at alex Marina)))
  )

  ; Meeting action: Planner with Stephanie for 120 minutes at Mission
  ; Requires both to be at Mission for the entire duration and time >= 90 at start
  (:durative-action meet-steph
     :parameters (?pl - person ?sp - person)
     :duration (= ?dur 120)
     :condition (and
        (over all (at ?pl Mission))
        (over all (at ?sp Mission))
        (at start (>= (time) 90)))
     :effect (at end (met ?pl ?sp))
  )

)