.class public Lcom/android/server/am/PreventRunning;
.super Ljava/lang/Object;
.source "PreventRunning.java"

# interfaces
.implements Lcom/android/server/am/PreventRunningHook;


# static fields
.field private static APKS:[Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "Prevent"

.field public static final VERSION:I = 0x133a200


# instance fields
.field private mPreventRunning:Lcom/android/server/am/PreventRunningHook;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 26
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "/data/app/me.piebridge.prevent-1/base.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "/data/app/me.piebridge.prevent-2/base.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "/data/app/me.piebridge.prevent-3/base.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "/data/app/me.piebridge.prevent-1.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "/data/app/me.piebridge.prevent-2.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "/data/app/me.piebridge.prevent-3.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "/system/app/Prevent.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "/system/priv-app/me.piebridge.prevent/me.piebridge.prevent.apk"

    aput-object v2, v0, v1
    
    sput-object v0, Lcom/android/server/am/PreventRunning;->APKS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 6

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    sget-object v1, Lcom/android/server/am/PreventRunning;->APKS:[Ljava/lang/String;

    array-length v2, v1

    const/4 v0, 0x0

    :goto_7
    if-ge v0, v2, :cond_1c

    aget-object v3, v1, v0

    .line 39
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 40
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-direct {p0, v4}, Lcom/android/server/am/PreventRunning;->initPreventRunning(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 44
    :cond_1c
    return-void

    .line 38
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method

.method private initPreventRunning(Ljava/io/File;)Z
    .registers 7

    .prologue
    .line 48
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 49
    new-instance v1, Ldalvik/system/DexClassLoader;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "/cache"

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4, v0}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 50
    const-string v0, "Prevent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "loading PreventRunning(20161024) from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    const-string v0, "me.piebridge.prevent.framework.PreventRunning"

    invoke-virtual {v1, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/PreventRunningHook;

    iput-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    .line 52
    const v0, 0x133a200

    invoke-virtual {p0, v0}, Lcom/android/server/am/PreventRunning;->setVersion(I)V

    .line 53
    const-string v0, "native"

    invoke-virtual {p0, v0}, Lcom/android/server/am/PreventRunning;->setMethod(Ljava/lang/String;)V
    :try_end_45
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_45} :catch_47
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_45} :catch_51
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_45} :catch_5a
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_45} :catch_63

    .line 54
    const/4 v0, 0x1

    .line 64
    :goto_46
    return v0

    .line 55
    :catch_47
    move-exception v0

    .line 56
    const-string v1, "Prevent"

    const-string v2, "cannot find class"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 64
    :goto_4f
    const/4 v0, 0x0

    goto :goto_46

    .line 57
    :catch_51
    move-exception v0

    .line 58
    const-string v1, "Prevent"

    const-string v2, "cannot instance class"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4f

    .line 59
    :catch_5a
    move-exception v0

    .line 60
    const-string v1, "Prevent"

    const-string v2, "cannot access class"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4f

    .line 61
    :catch_63
    move-exception v0

    .line 62
    const-string v1, "Prevent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot load PreventRunning from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4f
.end method


# virtual methods
.method public hookBindService(Landroid/content/Intent;)Z
    .registers 3

    .prologue
    .line 172
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->hookBindService(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public hookStartProcessLocked(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Landroid/content/ComponentName;)Z
    .registers 6

    .prologue
    .line 144
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/android/server/am/PreventRunningHook;->hookStartProcessLocked(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public hookStartService(Landroid/content/Intent;)Z
    .registers 3

    .prologue
    .line 177
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->hookStartService(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isActiviated()Z
    .registers 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isExcludingStopped(Ljava/lang/String;)Z
    .registers 3

    .prologue
    .line 139
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->isExcludingStopped(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public match(ILjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;)I
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 149
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_11

    .line 150
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object v7, p7

    invoke-interface/range {v0 .. v7}, Lcom/android/server/am/PreventRunningHook;->match(ILjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;)I

    move-result p1

    .line 152
    :cond_11
    return p1
.end method

.method public onAppDied(Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 104
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 105
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onAppDied(Ljava/lang/Object;)V

    .line 107
    :cond_9
    return-void
.end method

.method public onBroadcastIntent(Landroid/content/Intent;)V
    .registers 3

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 77
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onBroadcastIntent(Landroid/content/Intent;)V

    .line 79
    :cond_9
    return-void
.end method

.method public onCleanUpRemovedTask(Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 83
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 84
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onCleanUpRemovedTask(Ljava/lang/String;)V

    .line 86
    :cond_9
    return-void
.end method

.method public onDestroyActivity(Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 132
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 133
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onDestroyActivity(Ljava/lang/Object;)V

    .line 135
    :cond_9
    return-void
.end method

.method public onLaunchActivity(Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 111
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 112
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onLaunchActivity(Ljava/lang/Object;)V

    .line 114
    :cond_9
    return-void
.end method

.method public onMoveActivityTaskToBack(Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 97
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 98
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onMoveActivityTaskToBack(Ljava/lang/String;)V

    .line 100
    :cond_9
    return-void
.end method

.method public onResumeActivity(Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 118
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 119
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onResumeActivity(Ljava/lang/Object;)V

    .line 121
    :cond_9
    return-void
.end method

.method public onStartHomeActivity(Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 91
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onStartHomeActivity(Ljava/lang/String;)V

    .line 93
    :cond_9
    return-void
.end method

.method public onUserLeavingActivity(Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 125
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 126
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onUserLeavingActivity(Ljava/lang/Object;)V

    .line 128
    :cond_9
    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 165
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 166
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->setMethod(Ljava/lang/String;)V

    .line 168
    :cond_9
    return-void
.end method

.method public setSender(Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 69
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 70
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->setSender(Ljava/lang/String;)V

    .line 72
    :cond_9
    return-void
.end method

.method public setVersion(I)V
    .registers 3

    .prologue
    .line 158
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 159
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->setVersion(I)V

    .line 161
    :cond_9
    return-void
.end method
