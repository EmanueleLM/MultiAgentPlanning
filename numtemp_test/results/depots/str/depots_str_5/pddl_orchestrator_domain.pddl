(define (domain multi-agent-warehouse)
  (:requirements :strips :fluents)
  (:predicates
    (at ?obj ?place)                      ; object (truck, hoist, pallet, crate) is at place
    (in ?crate ?truck)                    ; crate is inside truck
    (on ?below ?above)                    ; below surface has above crate on it
    (clear ?obj)                          ; surface (crate or pallet) has nothing on top
    (idle ?hoist)                         ; hoist is idle
    (lifting ?hoist)                      ; hoist is currently lifting (busy)
    (holding ?hoist ?crate)               ; hoist is holding a crate
  )

  ; Truck actions (each truck action named distinctly)
  (:action drive-truck0
    :parameters (?from ?to)
    :precondition (at truck0 ?from)
    :effect (and (not (at truck0 ?from)) (at truck0 ?to))
  )
  (:action drive-truck1
    :parameters (?from ?to)
    :precondition (at truck1 ?from)
    :effect (and (not (at truck1 ?from)) (at truck1 ?to))
  )
  (:action drive-truck2
    :parameters (?from ?to)
    :precondition (at truck2 ?from)
    :effect (and (not (at truck2 ?from)) (at truck2 ?to))
  )
  (:action drive-truck3
    :parameters (?from ?to)
    :precondition (at truck3 ?from)
    :effect (and (not (at truck3 ?from)) (at truck3 ?to))
  )

  ; Hoist actions for each hoist. Actions are distinct per hoist (names include hoist id).
  ; 1)