(define (domain orchestrated-conflict)
  (:requirements :strips)
  (:predicates
    (province ?o)
    (planet ?o)
    (harmony)
    (pain)
    (object-craves ?o ?other)

    ;; ordered/sequencing flags (namespaced per agent to avoid accidental interaction)
    (attacker-attacking ?obj ?pl)            ;; holds between attack-initiate and attack-deliver
    (succumber-recovery ?obj)               ;; holds between cease-resistance and restore-orders
    (overcomer-recovery ?obj ?other)        ;; holds between recover-from-pain and transfer-province
    (feaster-satiated ?obj ?other)          ;; holds between satiate-craving and consume-and-transfer
  )

  ;; ATTACK (decomposed into two ordered steps)
  (:action attacker-initiate-attack
    :parameters (?obj ?pl)
    :precondition (and (province ?obj) (planet ?pl) (harmony))
    :effect (and (attacker-attacking ?obj ?pl) (not (harmony)))
  )

  (:action attacker-deliver-blow
    :parameters (?obj ?pl)
    :precondition (and (attacker-attacking ?obj ?pl) (province ?obj) (planet ?pl))
    :effect (and (pain) (not (province ?obj)) (not (planet ?pl)) (not (attacker-attacking ?obj ?pl)))
  )

  ;; SUCCUMB (decomposed into two ordered steps)
  (:action succumber-cease-resistance
    :parameters (?obj)
    :precondition (and (pain))
    :effect (and (not (pain)) (succumber-recovery ?obj))
  )

  (:action succumber-restore-orders
    :parameters (?obj)
    :precondition (and (succumber-recovery ?obj))
    :effect (and (province ?obj) (planet ?obj) (harmony) (not (succumber-recovery ?obj)))
  )

  ;; OVERCOME (decomposed into ordered recovery, transfer, then craving development)
  (:action overcomer-recover-from-pain
    :parameters (?obj ?other)
    :precondition (and (pain) (province ?other))
    :effect (and (not (pain)) (harmony) (overcomer-recovery ?obj ?other))
  )

  (:action overcomer-transfer-province
    :parameters (?obj ?other)
    :precondition (and (overcomer-recovery ?obj ?other) (province ?other))
    :effect (and (province ?obj) (not (province ?other)) (not (overcomer-recovery ?obj ?other)))
  )

  (:action overcomer-develop-craving
    :parameters (?obj ?other)
    :precondition (and (province ?obj))
    :effect (and (object-craves ?obj ?other))
  )

  ;; FEAST (decomposed into satiation followed by consumption/transfer)
  (:action feaster-satiate-craving
    :parameters (?obj ?other)
    :precondition (and (object-craves ?obj ?other) (province ?obj) (harmony))
    :effect (and (not (object-craves ?obj ?other)) (feaster-satiated ?obj ?other))
  )

  (:action feaster-consume-and-transfer
    :parameters (?obj ?other)
    :precondition (and (feaster-satiated ?obj ?other) (province ?obj))
    :effect (and (pain) (province ?other) (not (province ?obj)) (not (harmony)) (not (feaster-satiated ?obj ?other)))
  )
)