(define (domain mysteryblocksworld19)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?o - object)        ; object currently holds province
    (planet ?o - object)          ; object marked as planet
    (pain ?o - object)            ; object is in pain (transitional token)
    (craves ?s - object ?t - object) ; subject craves target
    (harmony)                     ; global harmony flag
  )

  ;; Attack: requires an object to be both province and planet and global harmony.
  ;; Produces pain on the object and removes its province/planet and global harmony.
  (:action attack
    :parameters (?o - object)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: consumes pain and restores province, planet, and harmony.
  (:action succumb
    :parameters (?o - object)
    :precondition (and
      (pain ?o)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; Overcome: requires that 'other' currently has province and subject is in pain.
  ;; Produces harmony, grants province to subject, creates a craving subject->other,
  ;; and removes the other's province and the subject's pain.
  (:action overcome
    :parameters (?subject - object ?other - object)
    :precondition (and
      (province ?other)
      (pain ?subject)
    )
    :effect (and
      (harmony)
      (province ?subject)
      (craves ?subject ?other)
      (not (province ?other))
      (not (pain ?subject))
    )
  )

  ;; Feast: consumes a craves(subject,other) relation while subject has province and harmony.
  ;; Produces pain on subject, grants province back to other, and removes the craving,
  ;; the subject's province, and global harmony.
  (:action feast
    :parameters (?subject - object ?other - object)
    :precondition (and
      (craves ?subject ?other)
      (province ?subject)
      (harmony)
    )
    :effect (and
      (pain ?subject)
      (province ?other)
      (not (craves ?subject ?other))
      (not (province ?subject))
      (not (harmony))
    )
  )
)