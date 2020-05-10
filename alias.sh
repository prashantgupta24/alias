export PATH=.:$PATH
shopt -s direxpand

alias root='sudo su -'
alias sedc="sed -e '/^$/d' -e '/^#.*$/d'"

# Kubectl and Kubernetes related aliases
alias util='kubectl get nodes --no-headers | awk '\''{print $1}'\'' | xargs -I {} sh -c '\''echo {} ; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo '\'''

alias kgputil="kubectl get pods -o custom-columns=NAME:.metadata.name,R_CPU:.spec.containers[0].resources.requests.cpu,R_MEMORY:.spec.containers[0].resources.requests.memory,L_CPU:.spec.containers[0].resources.limits.cpu,L_MEMORY:.spec.containers[0].resources.limits.memory"

alias icpversion="kubectl -n kube-system get ds platform-ui -o jsonpath='{\"Version=\"}{.spec.template.spec.containers[0].env[?(@.name==\"ICP_VERSION\")].value}{\"\n\"}'"

alias icpdversion="kubectl -n zen describe deployment icp4d-open-api | grep -i productVersion | xargs"

alias dnslogs="kubectl logs --namespace=kube-system \$(kubectl get pods --namespace=kube-system -l app=kube-dns -o name) -c kubedns"

alias dnsping="kubectl -n kube-system exec -it \$(echo \$(kubectl -n kube-system get pods -l app=kube-dns -o jsonpath='{.items[].metadata.name}')) -c kubedns -- ping -c4 google.com"

alias sl='tail -f /var/log/messages'
alias fc='fcslogrpt /var/log/messages'

alias k="kubectl"
alias kc="kubectl -n kube-system"
alias ki="kubectl -n istio-system"
alias kgp="kubectl get pods"
alias kgn="kubectl get nodes"
alias kgnw="kubectl get nodes -o wide"
alias kgpw="kubectl get pods -o wide"
alias kgpa="kubectl get pods -A"
alias kgpwa="kubectl get pods -A -o wide"
alias kgpaw="kubectl get pods -A -o wide"
alias kgpr="kubectl get pods --sort-by=.metadata.creationTimestamp --field-selector=status.phase!=Succeeded"
alias kgpnr="kubectl get po -o wide --all-namespaces --field-selector=status.phase!=Succeeded | grep -vE '1/1|2/2|3/3|4/4'"
alias kgps="kubectl get pods --sort-by=.metadata.creationTimestamp"
alias kgprc="kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'"
alias ktp="kubectl top pods --containers"
alias kge="kubectl get events --sort-by=.metadata.creationTimestamp"
alias kdp="kubectl describe pod"
alias kep="kubectl edit pod"
alias kgep="kubectl get ep"
alias keep="kubectl edit ep"
alias kdep="kubectl describe ep"
alias kgns="kubectl get ns"
alias kens="kubectl edit ns"
alias kdns="kubectl describe ns"
alias kgd="kubectl get deployment"
alias kdd="kubectl describe deployment"
alias ked="kubectl edit deployment"
alias kgds="kubectl get ds"
alias kdds="kubectl describe ds"
alias keds="kubectl describe ds"
alias kgj="kubectl get jobs"
alias kdj="kubectl describe jobs"
alias kej="kubectl edit jobs"
alias kgs="kubectl get secrets"
alias kds="kubectl describe secrets"
alias kes="kubectl edit secrets"
alias kgrs="kubectl get rs"
alias kdrs="kubectl describe rs"
alias kers="kubectl edit rs"
alias kgpv="kubectl get pv"
alias kdpv="kubectl describe pv"
alias kepv="kubectl edit pv"
alias kgpvc="kubectl get pvc"
alias kdpvc="kubectl describe pvc"
alias kepvc="kubectl edit pvc"
alias kgsvc="kubectl get svc"
alias kdsvc="kubectl describe svc"
alias kesvc="kubectl edit svc"
alias kgsts="kubectl get sts"
alias kdsts="kubectl describe sts"
alias kests="kubectl edit sts"
alias kgcm="kubectl get cm"
alias kdcm="kubectl describe cm"
alias kecm="kubectl edit cm"
alias kgsc="kubectl get sc"
alias kdsc="kubectl describe sc"
alias kesc="kubectl edit sc"

alias kcgp="kubectl -n kube-system get pods"
alias kcgps="kubectl -n kube-system get pods --sort-by=.metadata.creationTimestamp"
alias kcdp="kubectl -n kube-system describe pod"
alias kcep="kubectl -n kube-system edit pod"
alias kcgd="kubectl -n kube-system get deployment"
alias kcdd="kubectl -n kube-system describe deployment"
alias kced="kubectl -n kube-system edit deployment"
alias kcgds="kubectl -n kube-system get ds"
alias kcdds="kubectl -n kube-system describe ds"
alias kceds="kubectl -n kube-system edit ds"
alias kcgj="kubectl -n kube-system get jobs"
alias kcdj="kubectl -n kube-system describe jobs"
alias kcej="kubectl -n kube-system edit jobs"
alias kcgs="kubectl -n kube-system get secrets"
alias kcds="kubectl -n kube-system describe secrets"
alias kces="kubectl -n kube-system edit secrets"
alias kcgrs="kubectl -n kube-system get rs"
alias kcdrs="kubectl -n kube-system describe rs"
alias kcers="kubectl -n kube-system edit rs"
alias kcgpv="kubectl -n kube-system get pv"
alias kcdpv="kubectl -n kube-system describe pv"
alias kcepv="kubectl -n kube-system edit pv"
alias kcgpvc="kubectl -n kube-system get pvc"
alias kcdpvc="kubectl -n kube-system describe pvc"
alias kcepvc="kubectl -n kube-system edit pvc"
alias kcgsvc="kubectl -n kube-system get svc"
alias kcdsvc="kubectl -n kube-system describe svc"
alias kcesvc="kubectl -n kube-system edit svc"
alias kcgsts="kubectl -n kube-system get sts"
alias kcdsts="kubectl -n kube-system describe sts"
alias kcests="kubectl -n kube-system edit sts"
alias kcgcm="kubectl -n kube-system get cm"
alias kcdcm="kubectl -n kube-system describe cm"
alias kcecm="kubectl -n kube-system edit cm"
alias kcgsc="kubectl -n kube-system get sc"
alias kcdsc="kubectl -n kube-system describe sc"
alias kcesc="kubectl -n kube-system edit sc"
alias kci="ssh node02 kubectl -n kube-system -s https://127.0.0.1:8001"

# Kubernetes deletion related aliases
alias kpods='kubectl get pods --all-namespaces -o wide | awk '"'"'{split($3,a,"/"); if (a[1] != a[2] || $4 != "Running") print($0)}'"'"
alias podel='kubectl get po --all-namespaces --no-headers | grep 0/ | awk '"'"'{system("kubectl -n " $1 " delete po " $2 " --force --grace-period=0")}'"'"
alias kdpod='kubectl delete po --force --grace-period=0 -n '

# Typical aliases
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
alias ls-l='ls -l'
alias ltr='ls -ltr'
alias ls='ls -l --color=none'
alias l='ls -ltr'
alias s='ls -ltr'
alias llc='ls -l | lolcat'
alias dir='ls -l'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias md='mkdir -p'
alias o='less'
alias rd='rmdir'
alias rehash='hash -r'
alias unmount='echo "Error: Try the command: umount" 1>&2; false'


# Functions
ls-(){ if [[ $@ == "l" ]]; then command ls -l;else command ls -ltr | more; fi; }
function kexec(){ pod=$1; shift; kubectl exec -it $pod -- $@; }
function kcexec(){ pod=$1; shift; kubectl -n kube-system exec -it $pod -- $@; }
function klogs() { kubectl logs $*;}
function kclogs() { kubectl -n kube-system logs $*;}
function dpod() { N=$1; shift; NAME=$(kubectl get pods -o json | jq -r .items[$N].metadata.name); kubectl describe pod $NAME;}
function kdn() { N=$1; kubectl describe node 192.168.142.10${N};}

function sc ()
{
  N=$1
  shift
  kubectl config set-context $(kubectl config current-context) --namespace=$N
  export PS1="\[\e[1;32m\][\u@\h $(cs)\W]#\[\033[00m\] "
}

function cs ()
{
  CC=$(kubectl config current-context)
  NS=$(kubectl config view -o jsonpath="{.contexts[?(@.name==\"$CC\")].context.namespace}")
  export PS1="\[\e[1;32m\][\u@\h ($NS)\W]#\[\033[00m\] "
  echo "($NS)"
}
