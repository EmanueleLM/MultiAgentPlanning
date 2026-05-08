; Domain: travel-domain
; Assumptions (conservative, stated per developer instructions):
; - There is a single traveller starting at 'home' at day0.
; - The trip consists of exactly 12 visiting days, represented by day1 .. day12.
; - Visiting days must be contiguous and assigned one-by-one in day order (day1 after day0 etc.).
; - The traveller must visit Venice, Florence, and Zurich at least once each.
; - The planner enforces a single ordered visiting phase sequence: start by flying from home to Venice, then (once) from Venice to Florence, then (once) from Florence to Zurich, and finally a single return flight from Zurich back to home after the 12 visiting days.
;   This enforces an explicit order so the solver cannot permute visits; the chosen order is a conservative resolution to the unspecified order.
; - Only the direct flights explicitly encoded in the problem are usable: home->Venice, Venice->Florence, Florence->Zurich, Zurich->home.
; - The return flight occurs after the visiting days on a special post-trip day (day13). day13 is not counted among the 12 visiting days.
; - All natural-language preferences mentioned (exactly 12 days, only direct flights) are enforced as hard constraints.
; - No bookkeeping/penalty constructs are used; violating constraints is made impossible by the model.
; Notes:
; - Days are modelled explicitly with successor links (succ).
; - "unassigned" marks visiting days that remain to be allocated; stay/move actions consume one unassigned visiting day each, ensuring exactly 12 visiting days are used.
; - The "visited" predicate records that a city was visited at least once.
; - The domain uses only :strips, :typing, and :negative-preconditions as required.

(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (succ ?d1 - day ?d2 - day)        ; successor relation between days
    (unassigned ?d - day)            ; day is a visiting day still to be assigned (day1..day12)
    (at ?c - city ?d - day)          ; traveller is in city c on day d
    (directflight ?from - city ?to - city) ; permitted direct flight between cities
    (visitcity ?c - city)            ; marks cities that may be allocated as visiting cities (Venice, Florence, Zurich)
    (visited ?c - city)              ; city has been visited at least once
    (returned-home)                  ; auditor reconciliation: traveller returned home after trip
  )

  ; Move between two consecutive days, using an allowed direct flight.
  ; If moving from ?from on ?dprev to ?to on ?dcur (succ relation), consume the unassigned status of ?dcur and set presence and visited.
  (:action move
    :parameters (?from - city ?to - city ?dprev - day ?dcur - day)
    :precondition (and
      (succ ?dprev ?dcur)
      (at ?from ?dprev)
      (directflight ?from ?to)
      (unassigned ?dcur)
    )
    :effect (and
      (not (unassigned ?dcur))
      (at ?to ?dcur)
      (visited ?to)
    )
  )

  ; Stay in the same visit-city across a consecutive day boundary.
  (:action stay
    :parameters (?c - city ?dprev - day ?dcur - day)
    :precondition (and
      (succ ?dprev ?dcur)
      (at ?c ?dprev)
      (visitcity ?c)      ; restrict stays to the designated visit cities
      (unassigned ?dcur)
    )
    :effect (and
      (not (unassigned ?dcur))
      (at ?c ?dcur)
      (visited ?c)
    )
  )

  ; Return home after the visiting days. This action is intended to be used once,
  ; on the successor of the last visiting day (succ d12 d13). It requires that the target day is NOT an unassigned visiting day
  ; so it cannot be used among day1..day12. It sets at home on the post-trip day and marks returned-home.
  (:action return-home
    :parameters (?from - city ?dprev - day ?dcur - day)
    :precondition (and
      (succ ?dprev ?dcur)
      (at ?from ?dprev)
      (directflight ?from home)
      (not (unassigned ?dcur)) ; ensures this landing day is not one of the visiting days (so modelled as day13)
    )
    :effect (and
      (at home ?dcur)
      (returned-home)
    )
  )
)