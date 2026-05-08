(define (domain mysteryblocksworld19)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?o - object)             ; object currently holds province
    (planet ?o - object)               ; object marked as planet
    (pain ?o - object)                 ; object is in pain (transitional token)
    (craves ?s - object ?t - object)   ; subject craves target
    (harmony)                          ; global harmony flag
  )

  ;; striker's Attack action
  ;; Pre: object is both province and planet and global harmony
  ;; Add: pain on the object
  ;; Del: province, planet on the object and global harmony
  (:action striker_attack
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

  ;; relish's Succumb action
  ;; Pre: object has pain
  ;; Add: province, planet on the object and global harmony
  ;; Del: pain on the object
  (:action relish_succumb
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

  ;; overcomer's Overcome action
  ;; Pre: another object has province, subject is in pain
  ;; Add: harmony, province to subject, craves(subject, other)
  ;; Del: province from other, pain from subject
  (:action overcomer_overcome
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

  ;; overcomer's Feast action
  ;; Pre: subject craves other, subject has province, and global harmony
  ;; Add: pain on subject, province on other
  ;; Del: craving subject->other, province on subject, and global harmony
  (:action overcomer_feast
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